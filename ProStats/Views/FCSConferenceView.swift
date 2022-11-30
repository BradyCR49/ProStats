//
//  FCSConferenceView.swift
//  ProStats
//
//  Created by Brady Rhodes on 11/30/22.
//

import SwiftUI

struct FCSConferenceView: View {
    var body: some View {
            NavigationView {
                VStack{
                    Image("FCS")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .frame(width: 100,height: 125)
                    
                    Text("Please Select a Conference")
                        .font(.title2)
                        .bold()
                    ScrollView(.vertical,showsIndicators: false) {
                        Group{
                            NavigationLink(destination: PFLConferenceView(), label: {Image("PioneerFootballLeague")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                    .frame(width: 100,height: 125)
                            })
                            NavigationLink(destination: PFLConferenceView(), label: {Image("BigSky")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                    .frame(width: 200,height: 125)
                            })
                            NavigationLink(destination: PFLConferenceView(), label: {Image("OhioValley")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                    .frame(width: 200,height: 125)
                            })
                            NavigationLink(destination: PFLConferenceView(), label: {Image("SWAC")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                    .frame(width: 200,height: 125)
                            })
                            NavigationLink(destination: PFLConferenceView(), label: {Image("ColonialAthletic")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                    .frame(width: 200,height: 125)
                            })
                            NavigationLink(destination: PFLConferenceView(), label: {Image("BigSouth")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                    .frame(width: 200,height: 125)
                            })
                        }
                        .padding(15)
                    Spacer()
                        .navigationTitle(Text("ProStats Home"))
                }
            }
        }
    }
    
    struct FCSConferenceView_Previews: PreviewProvider {
        static var previews: some View {
            FCSConferenceView()
        }
    }
}
