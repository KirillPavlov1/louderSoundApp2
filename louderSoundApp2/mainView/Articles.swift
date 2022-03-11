//
//  Articles.swift
//  louderSoundApp2
//
//  Created by Кирилл on 11.03.2022.
//

import Foundation
import SwiftUI

struct articles: View{

    @ObservedObject var router: tabRouter

    var body: some View{
        VStack{
            HStack{
                Image("logo")
                Spacer()
                Button(action:{router.page = .settings})
                {
                    Image("settings")
                    .foregroundColor(Color.gray)
                }
            }
            .padding([.leading, .trailing], 70)
            .padding(.top, UIScreen.screenHeight * 0.05)
            Text("GENERATOR")
                .font(.system(size: UIScreen.screenHeight * 0.05, weight: .bold, design: .default))
                .foregroundColor(Color.white)
                .frame(width: UIScreen.screenWidth, alignment: .leading)
                .padding(.leading, 100)
            NavigationView{
                ScrollView()
                {
                    VStack{
                        NavigationLink(destination: article1())
                        {
                            HStack{
                                Text("ARTICLE")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 20))
                                Spacer()
                                Image("art1")
                                    //.scaleEffect(0.2)
                                    .resizable()
                                    .frame(width: 200, height: 100)
                                    .cornerRadius(40)
                            }
                            .padding(.horizontal, 30)
                        }
                        .frame(width: UIScreen.screenWidth)
                        .frame(height: UIScreen.screenHeight * 0.25)
                        .navigationBarHidden(true)
                        NavigationLink(destination: article2())
                        {
                            HStack{
                                Text("ARTICLE")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 20))
                                Spacer()
                                Image("art2")
                                    //.scaleEffect(0.2)
                                    .resizable()
                                    .frame(width: 200, height: 100)
                                    .cornerRadius(40)
                            }
                            .padding(.horizontal, 30)
                        }
                        .frame(width: UIScreen.screenWidth)
                        .frame(height: UIScreen.screenHeight * 0.25)
                        .navigationBarHidden(true)
                        NavigationLink(destination: article3())
                        {
                            HStack{
                                Text("ARTICLE")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 20))
                                Spacer()
                                Image("art3")
                                    //.scaleEffect(0.2)
                                    .resizable()
                                    .frame(width: 200, height: 100)
                                    .cornerRadius(40)
                            }
                            .padding(.horizontal, 30)
                        }
                        .frame(width: UIScreen.screenWidth)
                        .frame(height: UIScreen.screenHeight * 0.25)
                        .navigationBarHidden(true)
                        NavigationLink(destination: article4())
                        {
                            HStack{
                                Text("ARTICLE")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 20))
                                Spacer()
                                Image("art4")
                                    //.scaleEffect(0.2)
                                    .resizable()
                                    .frame(width: 200, height: 100)
                                    .cornerRadius(40)
                            }
                            .padding(.horizontal, 30)
                        }
                        .frame(width: UIScreen.screenWidth)
                        .frame(height: UIScreen.screenHeight * 0.25)
                        .navigationBarHidden(true)
                        NavigationLink(destination: article5())
                        {
                            HStack{
                                Text("ARTICLE")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 20))
                                Spacer()
                                Image("art5")
                                    //.scaleEffect(0.2)
                                    .resizable()
                                    .frame(width: 200, height: 100)
                                    .cornerRadius(40)
                            }
                            .padding(.horizontal, 30)
                        }
                        .frame(width: UIScreen.screenWidth)
                        .frame(height: UIScreen.screenHeight * 0.25)
                        .navigationBarHidden(true)
                        NavigationLink(destination: article6())
                        {
                            HStack{
                                Text("ARTICLE")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 20))
                                Spacer()
                                Image("art6")
                                    //.scaleEffect(0.2)
                                    .resizable()
                                    .frame(width: 200, height: 100)
                                    .cornerRadius(40)
                            }
                            .padding(.horizontal, 30)
                        }
                        .frame(width: UIScreen.screenWidth)
                        .frame(height: UIScreen.screenHeight * 0.25)
                        .navigationBarHidden(true)
                    }
                }
                .background(Color(red: 0.071, green: 0.118, blue: 0.157))
            }
        }
        .background(Color(red: 0.071, green: 0.118, blue: 0.157))
        .edgesIgnoringSafeArea(.all)
        }
}

struct article1: View{

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View{
        ZStack{
            Rectangle()
                .fill(Color(red: 0.071, green: 0.118, blue: 0.157))
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack{
                    Image("art1")
                        //.scaleEffect(0.4)
                        .frame(height: 100)
                    Text("Article1")
                        .frame(width: UIScreen.screenWidth * 0.85,alignment: .leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 30, weight: .bold))
                    Text("Have you ever wondered how, with just two ears, we are able to locate sounds coming from all around us? Or, when you are playing a video game, why it seems like an explosion came from right behind you, even though you were in the safety of your own home? Our minds determine where sound is coming from using multiple cues. Two of these cues are which ear the sound hits first, and how loud the sound is when it reaches each ear. For example, if the sound hits your right ear first, it likely originated to the right of your body. If it hits both ears at the same time, it likely originated from directly in front or behind you. Creators of movies and video games use these cues to trick our minds—that is, to give us the illusion that certain sounds are coming from specific directions. In this article, we will explore how your brain gathers information from your ears and uses that information to determine where a sound is coming from.")
                        .foregroundColor(Color.gray)
                        .frame(width: UIScreen.screenWidth * 0.85,alignment: .leading)
                        .font(.system(size: 30))
                    Spacer()
                }
            }
            VStack{
                Button(action: {self.presentationMode.wrappedValue.dismiss();})
                {
                    HStack{
                        Image(systemName: "chevron.left")
                        Text("Articles")
                    }
                    .padding(.top, UIScreen.screenHeight * 0.05)
                    .padding(.bottom)
                    .frame(width: UIScreen.screenWidth * 0.85,alignment: .leading)
                    .foregroundColor(Color.white)
                    .font(.system(size: 23))
                }
                Spacer()
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct article2: View{

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View{
        ZStack{
            Rectangle()
                .fill(Color(red: 0.071, green: 0.118, blue: 0.157))
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack{
                    Image("art2")
                        //.scaleEffect(0.4)
                        .frame(height: 100)
                    Text("Article2")
                        .frame(width: UIScreen.screenWidth * 0.85,alignment: .leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 30, weight: .bold))
                    Text("Sound, a mechanical disturbance from a state of equilibrium that propagates through an elastic material medium. A purely subjective definition of sound is also possible, as that which is perceived by the ear, but such a definition is not particularly illuminating and is unduly restrictive, for it is useful to speak of sounds that cannot be heard by the human ear, such as those that are produced by dog whistles or by sonar equipment. The study of sound should begin with the properties of sound waves. There are two basic types of wave, transverse and longitudinal, differentiated by the way in which the wave is propagated. In a transverse wave, such as the wave generated in a stretched rope when one end is wiggled back and forth, the motion that constitutes the wave is perpendicular, or transverse, to the direction (along the rope) in which the wave is moving. An important family of transverse waves is generated by electromagnetic sources such as light or radio, in which the electric and magnetic fields constituting the wave oscillate perpendicular to the direction of propagation.")
                        .foregroundColor(Color.gray)
                        .frame(width: UIScreen.screenWidth * 0.85,alignment: .leading)
                        .font(.system(size: 30))
                    Spacer()
                }
            }
            VStack{
                Button(action: {self.presentationMode.wrappedValue.dismiss();})
                {
                    HStack{
                        Image(systemName: "chevron.left")
                        Text("Articles")
                    }
                    .padding(.top, UIScreen.screenHeight * 0.05)
                    .padding(.bottom)
                    .frame(width: UIScreen.screenWidth * 0.85,alignment: .leading)
                    .foregroundColor(Color.white)
                    .font(.system(size: 23))
                }
                Spacer()
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct article3: View{

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View{
        ZStack{
            Rectangle()
                .fill(Color(red: 0.071, green: 0.118, blue: 0.157))
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack{
                    Image("art3")
                        //.scaleEffect(0.4)
                        .frame(height: 100)
                    Text("Article3")
                        .frame(width: UIScreen.screenWidth * 0.85,alignment: .leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 30, weight: .bold))
                    Text("A person may be well acquainted with acoustics, and may understand the principles upon which the science of music is based, and yet may be no mUSlClan. On the other hand, a person may be a musician, and yet be unacquainted with the laws of acoustics. A musician is a person who can readily strike the different notes of music and produce harmonious sounds, either with the voice or an instrument. The art of music is solely a practical one. The number of musicians, as well as non-mnsicians, who are acquainted with the cause of sound and music, is but small, therefore a brief dissertation on the subject will not be devoid of interest or instruction. Mr. Driggs says, in regard to his new theory of acoustics, \" I discard the belief that sound is produced by air alone, commonly called concussion, producing waves or circles of air, and shall treat sound itself as possessing a more independent existence, and attempt to show that atmospheric air acts more in the capacity of a medium to convey it to the ear, and is the telegraph wire that conveys the impression it receives, and that is not the first cause.\" It was at one time believed that sounds were produced by emissions from bodies, like odors from flowers, and that these affected the sense of hearing as perfumes the sense of smellingj Mr. Driggs appears to be tinged with a kindred opinion. He is evidently mistaken in supposing that any scientific man acquainted with the laws of acoustics entertains the opinion that atmospheric air is either the first or only cause of sounu, or that it is eventhesale medium for conv'eying it. Sound is caused by the simple but rapid mechanical vibrations of various elastic bodies. ")
                        .foregroundColor(Color.gray)
                        .frame(width: UIScreen.screenWidth * 0.85,alignment: .leading)
                        .font(.system(size: 30))
                    Spacer()
                }
            }
            VStack{
                Button(action: {self.presentationMode.wrappedValue.dismiss();})
                {
                    HStack{
                        Image(systemName: "chevron.left")
                        Text("Articles")
                    }
                    .padding(.top, UIScreen.screenHeight * 0.05)
                    .padding(.bottom)
                    .frame(width: UIScreen.screenWidth * 0.85,alignment: .leading)
                    .foregroundColor(Color.white)
                    .font(.system(size: 23))
                }
                Spacer()
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct article4: View{

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View{
        ZStack{
            Rectangle()
                .fill(Color(red: 0.071, green: 0.118, blue: 0.157))
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack{
                    Image("art4")
                        //.scaleEffect(0.4)
                        .frame(height: 100)
                    Text("Article4")
                        .frame(width: UIScreen.screenWidth * 0.85,alignment: .leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 30, weight: .bold))
                    Text("Sound is the energy things produce when they vibrate (move back and forth quickly). If you bang a drum, you make the tight skin vibrate at very high speed (it's so fast that you can't usually see it), forcing the air all around it to vibrate as well. As the air moves, it carries energy out from the drum in all directions. Eventually, even the air inside your ears starts vibrating—and that's when you begin to perceive the vibrating drum as a sound. In short, there are two different aspects to sound: there's a physical process that produces sound energy to start with and sends it shooting through the air, and there's a separate psychological process that happens inside our ears and brains, which convert the incoming sound energy into sensations we interpret as noises, speech, and music. We're just going to concentrate on the physical aspects of sound in this article.")
                        .foregroundColor(Color.gray)
                        .frame(width: UIScreen.screenWidth * 0.85,alignment: .leading)
                        .font(.system(size: 30))
                    Spacer()
                }
            }
            VStack{
                Button(action: {self.presentationMode.wrappedValue.dismiss();})
                {
                    HStack{
                        Image(systemName: "chevron.left")
                        Text("Articles")
                    }
                    .padding(.top, UIScreen.screenHeight * 0.05)
                    .padding(.bottom)
                    .frame(width: UIScreen.screenWidth * 0.85,alignment: .leading)
                    .foregroundColor(Color.white)
                    .font(.system(size: 23))
                }
                Spacer()
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct article5: View{

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View{
        ZStack{
            Rectangle()
                .fill(Color(red: 0.071, green: 0.118, blue: 0.157))
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack{
                    Image("art5")
                        //.scaleEffect(0.4)
                        .frame(height: 100)
                    Text("Article5")
                        .frame(width: UIScreen.screenWidth * 0.85,alignment: .leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 30, weight: .bold))
                    Text("Before you can understand sound, you have to understand how your ears work. After all, what goes on inside your ears is what allows you to hear. For example, when a person talks, the movement of their mouth creates waves of moving air. These sound waves travel into your ear canal and hit your eardrum. This causes the ossicles to vibrate. These three small bones are called malleus, the incus and the stapes. They are also known as the hammer, the anvil, and the stirrup. The vibrating ossicles transmit the sound waves to the cochlea. It’s a small, snail-shaped structure inside your head. The cochlea contains small cells called hair cells that convert sound waves into signals. The signals then get sent to your brain. And that is what allows you to hear someone’s voice!")
                        .foregroundColor(Color.gray)
                        .frame(width: UIScreen.screenWidth * 0.85,alignment: .leading)
                        .font(.system(size: 30))
                    Spacer()
                }
            }
            VStack{
                Button(action: {self.presentationMode.wrappedValue.dismiss();})
                {
                    HStack{
                        Image(systemName: "chevron.left")
                        Text("Articles")
                    }
                    .padding(.top, UIScreen.screenHeight * 0.05)
                    .padding(.bottom)
                    .frame(width: UIScreen.screenWidth * 0.85,alignment: .leading)
                    .foregroundColor(Color.white)
                    .font(.system(size: 23))
                }
                Spacer()
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct article6: View{

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View{
        ZStack{
            Rectangle()
                .fill(Color(red: 0.071, green: 0.118, blue: 0.157))
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack{
                    Image("art6")
                        //.scaleEffect(0.4)
                        .frame(height: 100)
                    Text("Article6")
                        .frame(width: UIScreen.screenWidth * 0.85,alignment: .leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 30, weight: .bold))
                    Text("THE second part of Lord Rayleigh's highly instructive work on acoustics contains the mechanics of oscillatory motions in liquids and gases. Atmospheric air is that medium by which by far the greater number of sound-waves are conveyed to our ear, since it is only exceptional that this happens through solid bodies which are in contact with our teeth or with the bones of the skull. But it is just for this reason that all circumstances are of considerable importance, which influence the transmission of sound-waves in the air, i.e., change either their velocity, their direction, or their intensity. This part of the theory has been worked out very minutely and completely by the author. We find here the compilation and demonstration of a large number of facts which, in other works on acoustics, are hardly mentioned. The author, after having first developed (in Chap. XI.) the general laws of the motion of liquids as expressed in hydrodynamical equations, and then explained the difference between rotational and irrotational motion of fluids, passes on to the simplification of the equations, which is determined by the circumstance that with sound, as a rule, we have to do with oscillations of extremely small amplitude. First, the motion of plane waves is investigated, and it is shown that with waves which move only in one direction half their equivalent of work consists in the vis viva of motion, and the other half in the potential energy of the compression and dilatation of the medium. Then follows the explanation of the influence which the change of temperature, taking place with compression or dilatation of gases, exercises upon the velocity of transmission of sound. It is shown, in the manner first employed by Prof. Stokes, that if a perceptible quantity of heat could be exchanged between the compressed and dilated layers of the waves during the lapse of one oscillation, the intensity of the sound-waves would very quickly decrease in their transmision and they would die away.")
                        .foregroundColor(Color.gray)
                        .frame(width: UIScreen.screenWidth * 0.85,alignment: .leading)
                        .font(.system(size: 30))
                    Spacer()
                }
            }
            VStack{
                Button(action: {self.presentationMode.wrappedValue.dismiss();})
                {
                    HStack{
                        Image(systemName: "chevron.left")
                        Text("Articles")
                    }
                    .padding(.top, UIScreen.screenHeight * 0.05)
                    .padding(.bottom)
                    .frame(width: UIScreen.screenWidth * 0.85,alignment: .leading)
                    .foregroundColor(Color.white)
                    .font(.system(size: 23))
                }
                Spacer()
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}



struct article_Previews: PreviewProvider {
    static var previews: some View {
        articles(router: tabRouter())
    }
}
