//
//  MyHomeView.swift
//  Vodam
//
//  Created by 김민우 on 11/17/25.
//
import SwiftUI
import ComposableArchitecture


// MARK: view
struct MyHomeView: View {
    // MARK: model
    @Bindable var store: StoreOf<MyHome>
    init(_ store: StoreOf<MyHome>) {
        self.store = store
    }
    
    
    // MARK: body
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    quickActionsSection
                    recentProjectsSection
                }
                .padding(24)
            }
            .navigationTitle("안녕하세요!")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        store.send(.showLoginInfo)
                    } label: {
                        Image(systemName: "person.circle")
                            .imageScale(.large)
                    }
                }
            }
            // navigationDestination
            .fullScreenCover(
                item: $store.scope(
                    state: \.destination?.loginForm,
                    action: \.destination.loginForm
                ),
                content: { store in
                    LoginFormView(store)
                }
            )
//            .navigationDestination(
//                item: $store.scope(
//                    state: \.destination?.loginForm,
//                    action: \.destination.loginForm
//                ),
//                destination: { store in
//                    LoginFormView(store: store)
//                }
//            )
            
            // sheet
            .sheet(
                item: $store.scope(
                    state: \.destination?.loginInfo,
                    action: \.destination.loginInfo
                )
            ) { store in
                LoginInfoView(store: store)
                    .presentationDetents([.fraction(0.4)])
                    .presentationDragIndicator(.visible)
            }
        }
    }
    
    // MARK: - Sections
    private var quickActionsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 16) {
                Button(action: {}) {
                    HomeQuickActionCard(
                        iconName: "mic.fill",
                        iconColor: .blue,
                        title: "음성 녹음",
                    )
                }

                Button(action: {}) {
                    HomeQuickActionCard(
                        iconName: "doc.richtext.fill",
                        iconColor: .cyan,
                        title: "PDF 업로드",

                    )
                }
            }

            Button(action: {}) {
                HomeQuickActionCard(
                    iconName: "tray.and.arrow.up.fill",
                    iconColor: .indigo,
                    title: "파일 업로드",
                    isFullWidth: true
                )
            }
        }
        .padding(.top, 16)
    }

    private var recentProjectsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("최근 프로젝트")
                .font(.title3.bold())

            VStack(spacing: 12) {
                RecentProjectRow(
                    iconName: "doc.text.fill",
                    iconColor: .blue,
                    title: "분기별 시장 분석",
                    dateDescription: "2024년 5월 20일",
                    statusText: "완료",
                    statusColor: .green
                )

                RecentProjectRow(
                    iconName: "waveform.circle.fill",
                    iconColor: .purple,
                    title: "클라이언트 인터뷰 녹음",
                    dateDescription: "2024년 5월 22일",
                    statusText: "분석 중",
                    statusColor: .blue
                )
            }
        }
        .padding(.top, 24)
    }
}

private struct HomeQuickActionCard: View {
    let iconName: String
    let iconColor: Color
    let title: String
    var isFullWidth: Bool = false

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(iconColor.opacity(0.15))
                    .frame(width: 32, height: 32)

                Image(systemName: iconName)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(iconColor)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
            }

            Spacer()
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color.gray.opacity(0.1))
        )
    }
}

private struct RecentProjectRow: View {
    let iconName: String
    let iconColor: Color
    let title: String
    let dateDescription: String
    let statusText: String
    let statusColor: Color

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(iconColor.opacity(0.15))
                    .frame(width: 44, height: 44)

                Image(systemName: iconName)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(iconColor)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline.bold())

                Text(dateDescription)
                    .font(.caption)
            }

            Spacer()

            Text(statusText)
                .font(.caption.bold())
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(
                    Capsule()
                        .fill(statusColor.opacity(0.9))
                )
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color.gray.opacity(0.04))
        )
    }
}


#Preview {
    MyHomeView(
        Store(initialState: MyHome.State()) {
            MyHome()
        }
    )
}
