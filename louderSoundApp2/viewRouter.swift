//
//  viewRouter.swift
//  louderSoundApp2
//
//  Created by Кирилл on 10.03.2022.
//

import Foundation
import SwiftUI
import ApphudSDK

enum Page {
    case onBoarding
    case main
}

class ViewRouter: ObservableObject {
    var a: Bool
    @Published var currentPage: Page = Apphud.hasActiveSubscription() ? .main : .onBoarding
    private var product: ApphudProduct!
    private var title: String?
    private var subtitle: String?
    private var subunits: Int?
    var subperiod: String!
    var trialperiod: String!
    var productPrice: String!
    var trialPrice: String!
    var productCurrency: String!
    
    init()
    {
        a = Apphud.hasActiveSubscription()
        configureProduct()
    }
    
    func subscribeButtonAction(){
        // 4 - Делаем покупку
        Apphud.purchase(product) { [self]result in
            if let subscription = result.subscription, subscription.isActive(){
                currentPage = .main
                a = true
            } else if let purchase = result.nonRenewingPurchase, purchase.isActive(){
                currentPage = .main
                a = true
            } else {
            }
        }
    }
    
    func configure() {
        guard let skProduct = product.skProduct else { return }
        let subUnits = skProduct.subscriptionPeriod?.numberOfUnits
        let trialUnits = skProduct.introductoryPrice?.subscriptionPeriod.numberOfUnits
        
        subperiod = skProduct.subscriptionPeriod?.unit.pluralisedDescription(length: subUnits)
        trialperiod = skProduct.introductoryPrice?.subscriptionPeriod.unit.pluralisedDescription(length: trialUnits)
        self.productPrice = skProduct.localizedPrice
        self.trialPrice = skProduct.localizedTrialPrice
        self.productCurrency = skProduct.priceLocale.currencyCode
        
    }


    func restore_product(){
        Apphud.restorePurchases{ subscriptions, purchases, error in
           if Apphud.hasActiveSubscription(){
               self.currentPage = .main
           } else {
             // no active subscription found, check non-renewing purchases or error
           }
        }
    }
    
    func configureProduct() {
        // - 3. Конфигурируем apphud product
        Apphud.getPaywalls { [weak self] (paywalls, _) in
            if let paywall = paywalls?.last {
                guard let product = paywall.products.first
                else {
                    return
                }
                self?.product = product
                let json = paywall.json
                self?.title = json?["title"] as? String
                self?.subtitle = json?["subtitle"] as? String
            }
            else {
            }
        }
    }
}
