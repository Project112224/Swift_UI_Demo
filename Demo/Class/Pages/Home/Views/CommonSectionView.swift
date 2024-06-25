//
//  CommonSectionView.swift
//  Demo
//
//  Created by Brook on 2024/2/6.
//

import SwiftUI

enum CommonSectionViewType {
    /// 工作檢視
    case work
    /// 常用指數
    case indices
    /// 匯率
    case rate
}

struct CommonSectionView: View {
    
    var type: CommonSectionViewType
    
    var body: some View {
        
        switch type {
        case .work:
            return AnyView(buildWorkBody())
        case .indices:
            return AnyView(buildIndicesBody())
        case .rate:
            return AnyView(buildRateBody())
        }
        
    }
    
    @ViewBuilder
    private func buildWorkBody() -> some View {
        VStack(alignment: .trailing) {
            HStack(alignment: .center) {
                Text("工作檢視")
                    .font(.system(size: 18, weight: .bold))
                    .bold()
                    .foregroundColor(Colors.green700)
                Spacer()
                HStack {
                    if (UIDevice.isIPad) {
                        DateControlView()
                            .frame(height: 38)
                            .padding(.horizontal, 10)
                    }
                    SegmentControlView(action: { index in
                        print("select index \(index)")
                    })
                }
            }
            .frame(alignment: .trailing)
            .background(.white)

            if (UIDevice.isIPhone) {
                DateControlView()
                    .frame(height: 38)
                    .padding(.horizontal, 10)
            }
        }
    }
    
    @ViewBuilder
    private func buildIndicesBody() -> some View {
        HStack {
            Text("常用指數")
                .font(.system(size: 18, weight: .bold))
                .bold()
                .foregroundColor(Colors.green700)
                .frame(alignment: .leading)
            
            Spacer()
            
            Button(action: {

            }) {
                Image(ImageName.iconMore)
                    .foregroundColor(.black)
                    .background(Color.clear)
            }
            .buttonStyle(BorderlessButtonStyle())
            
        }
        .frame(alignment: .leading)
    }
    
    @ViewBuilder
    private func buildRateBody() -> some View {
        VStack {
            HStack {
                Text("匯率走勢")
                    .font(.system(size: 18, weight: .bold))
                    .bold()
                    .foregroundColor(Colors.green700)
                    .frame(alignment: .leading)
                
                Spacer()
                
                Button(action: {

                }) {
                    Image(ImageName.iconMore)
                        .foregroundColor(.black)
                        .background(Color.clear)
                }
                .buttonStyle(BorderlessButtonStyle())

            }
            .frame(alignment: .leading)
            
            HStack {
                Text("美元匯率")
                    .font(.system(size: 18))
                    .foregroundColor(Color.black)
                    .frame(alignment: .leading)
                
                Spacer()
                
                HStack {
                    PickerControlView()
                    
                    SegmentControlView(items: ["走勢圖", "數據表"])
                }
            }
        }
        
    }
    
}


#Preview {
    CommonSectionView(type: .work)
}

