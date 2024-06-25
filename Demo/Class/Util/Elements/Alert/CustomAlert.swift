//
//  CustomAlert.swift
//  Demo
//
//  Created by --- on 2024/2/6.
//

import SwiftUI

struct CustomAlert: View {
    
    @Binding var presentAlert: Bool
    
    @State var alertType: AlertType = .success
    
    var widthOffset: Double = 0.45
    
    var messageAlignment: TextAlignment = .center
    
    var isShowVerticalButtons = false
    var messageColor = Color.black
    
    var leftButtonAction: (() -> ())?
    var rightButtonAction: (() -> ())?
    
    let verticalButtonsHeight: CGFloat = 80
    
    var body: some View {
        
        ZStack {
            
            Color.black.opacity(0.75)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {

                if (!alertType.title().isEmpty) {
                    Text(alertType.title())
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .frame(height: 25)
                        .padding(.top, 16)
                        .padding(.bottom, 8)
                        .padding(.horizontal, 16)
                } else {
                    Text("").frame(height: 15)
                }

                Text(alertType.message())
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .font(.system(size: 14))
                    .foregroundColor(messageColor)
                    .multilineTextAlignment(messageAlignment)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                    .minimumScaleFactor(0.5)

                Divider()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 0.5)
                    .padding(.all, 0)
                
                HStack(spacing: 0) {

                        if (!alertType.leftActionText.isEmpty) {
                            Button {
                                leftButtonAction?()
                                self.presentAlert.toggle()
                            } label: {
                                Text(alertType.leftActionText)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            }
                            Divider()
                                .frame(minWidth: 0, maxWidth: 0.5, minHeight: 0, maxHeight: .infinity)
                        }

                        Button {
                            rightButtonAction?()
                            self.presentAlert.toggle()
                        } label: {
                            Text(alertType.rightActionText)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(Colors.green500)
                                .multilineTextAlignment(.center)
                                .padding(15)
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        }

                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 55)
                    .padding([.horizontal, .bottom], 0)

            }
            .frame(
                width: UIScreen.main.bounds.width * widthOffset,
                height: alertType.height(isShowVerticalButtons: isShowVerticalButtons)
            )
            .background(Color.white)
            .cornerRadius(12)
            
        }
        
    }
}
