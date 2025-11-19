## 소개
Vodam은 Alan AI 음성 명령을 활용하는 iOS 앱입니다.

## Secrets.xcconfig 구성
빌드에 Alan API 토큰이 필요하므로 아래 절차를 따라 `Secrets.xcconfig`를 설정합니다.

1. `Secrets.xcconfig.example`를 복사해 `Secrets.xcconfig`를 생성합니다.
2. 발급받은 토큰 값으로 `ALAN_API_TOKEN = <YOUR_TOKEN>`을 입력합니다.
3. Xcode에서 프로젝트를 연 뒤, Target의 **Build Settings > Base Configuration** 항목에 `Secrets.xcconfig`를 지정합니다. (Debug/Release 각각 설정)

이후부터는 `Secrets.xcconfig`만 업데이트하면 빌드 시 자동으로 토큰이 주입됩니다.
