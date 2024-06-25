//
//  WorkRowView.swift
//  Demo
//
//  Created by Brook on 2024/2/6.
//

import SwiftUI

struct WorkRowView: View {
    let appointment: AppointmentModel
    let isLast: Bool
    
    var viewAction: (AppointmentModel) -> Void
    var noteAction: (String) -> Void
    var recordAction: () -> Void
    var otherAction: () -> Void
    
    init(
        appointment: AppointmentModel,
        isLast: Bool,
        viewAction: @escaping (AppointmentModel) -> Void,
        noteAction: @escaping (String) -> Void,
        recordAction: @escaping () -> Void,
        otherAction: @escaping () -> Void
    ) {
        self.appointment = appointment
        self.isLast = isLast
        self.viewAction = viewAction
        self.noteAction = noteAction
        self.recordAction = recordAction
        self.otherAction = otherAction
    }
    
    var body: some View {
        GeometryReader { geometry in
            let widthOffset = (geometry.size.width - 48) / (UIDevice.isIPad ? 9 : 5);
            VStack {
                HStack {
                    //index
                    Text(String(appointment.id))
                        .frame(minWidth: widthOffset, maxWidth: widthOffset, alignment: .center)
                    
                    
                    if (UIDevice.isIPad) {
                        // 時間
                        Text(appointment.time)
                            .font(.system(size: 14))
                            .frame(minWidth: widthOffset, maxWidth: widthOffset, alignment: .leading)
                    }
                    
                    
                    // 客戶
                    Text(appointment.client)
                        .font(.system(size: 14))
                        .frame(minWidth: widthOffset,  maxWidth: widthOffset, alignment: .leading)
                    
                    if (UIDevice.isIPad) {
                        // 類別
                        Text(appointment.category)
                            .font(.system(size: 14))
                            .frame(minWidth: widthOffset,  maxWidth: widthOffset, alignment: .leading)
                        // 地點
                        Text(appointment.location)
                            .font(.system(size: 14))
                            .frame(minWidth: widthOffset, maxWidth: widthOffset, alignment: .leading)
                            .lineLimit(1)
                    }
                    
                    
                    // 視圖
                    Button(action: {
                        viewAction(appointment)
                    }) {
                        Image(ImageName.profile)
                            .background(Color.clear)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .frame(minWidth: widthOffset, maxWidth: widthOffset, alignment: .center)
                    
                    
                    if (UIDevice.isIPad) {
                        // 註記
                        Button(action: {
                            noteAction(appointment.note)
                        }) {
                            Image(ImageName.iconPaper)
                                //.foregroundColor(.black)
                                .background(Color.clear)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        .frame(minWidth: widthOffset, maxWidth: widthOffset, alignment: .center)
                    }
                    
                    
                    //互動紀錄
                    Button(action: {
                        recordAction()
                    }) {
                        HStack {
                            if (UIDevice.isIPad) {
                                Text(appointment.record)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color.black)
                            }
                            Image((appointment.recordEnum == .file) ? ImageName.iconPaperplus : ImageName.iconEdit)
                                .background(Color.clear)
                        }
                        .frame(alignment: .center)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .frame(minWidth: widthOffset, maxWidth: widthOffset, alignment: .center)
                    
                    
                    //約訪
                    Button(action: {
                        otherAction()
                    }) {
                        Image(ImageName.iconMore)
                            //.foregroundColor(.black)
                            .background(Color.clear)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .frame(minWidth: widthOffset, maxWidth: widthOffset, alignment: .center)
                }
                .listRowBackground(Color.white)
                
                if (!isLast) {
                    Divider()
                } else {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.clear)
                }
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }.frame(height: 36)
    }
}
