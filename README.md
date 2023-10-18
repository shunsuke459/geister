# 自動生成コマンド

```shell
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

# ビルド前の確認事項
- Firestoreの接続先がローカルになっていないか確認（main.dart）
- ビルドコマンド
```shell
fvm flutter build ipa --build-name={適切なバージョン} --release
```