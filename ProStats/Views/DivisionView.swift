//
//  DivisionView.swift
//  ProStats
//
//  Created by Brady Rhodes on 11/30/22.
//

import SwiftUI

struct DivisionView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Welcome To")
                    .font(.title)
                    .bold()
                Image("ProStatsLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    .frame(width: 100,height: 75)
                Text("Please Select a Division")
                    .font(.title2)
                    .bold()
                    List{
                        NavigationLink(destination: FCSConferenceView(), label: {Text("FBS (1-A)")
                        })
                        NavigationLink(destination: FCSConferenceView(), label: {Text("FCS (1-AA)")
                        })
                        NavigationLink(destination: PFLConferenceView(), label: {Text("NCAA Division II")
                        })
                        NavigationLink(destination: PFLConferenceView(), label: {Text("NCAA Division III")
                        })
                        NavigationLink(destination: PFLConferenceView(), label: {Text("NAIA")
                        })
                }
            }
        }
    }
    struct DivisionView_Previews: PreviewProvider {
        static var previews: some View {
            DivisionView()
        }
    }
}
