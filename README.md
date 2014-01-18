unite-dwm
=========

[dwm.vim](https://github.com/spolu/dwm.vim) の Unite sourceです。

## 必要なもの

[unite.vim](https://github.com/Shougo/unite.vim)

## 使い方

`:Unite dwm`

## アクション

このsourceはwindow sourceを継承しています。  
基本的にはwindow sourceと同じアクションが使えますが、以下の点だけ拡張されています。

### focus(デフォルトアクション)

`DWM_Focus` を実行します。

### delete

`DWM_Close` を実行します。

## その他

openアクションが実行できるsourceに以下のアクションが追加されます。

### dwm_open

  - candidateがすでにいずれかのwindowで開かれていたら、そのwindowをメインにします。
  - candidateがすでにbufferに存在してはいるもののwindowで開かれていない場合、新しくメインのwindowを作成し、そこにcandidateを開きます。
  - それ以外の場合は `DWM_New` を実行してcandidateを開きます。

### 変数

  - `g:unite_dwm_source_names_as_default_action`
    - 指定すると、そのsourceのデフォルトアクションが `dwm_open` になります。
    - 例: `let g:unite_dwm_source_names_as_default_action = 'buffer,file,file_mru'`
