# repositoryutility

Visual SourceSafe(VSS) や、Subversion の機能を拡張したり、運用を補助したりするツールの集まり。

## description

* VSSEvents  
VSSのイベントハンドラを拡張して、機能を追加するdllです。
1. チェックイン前) チェックインコメントが記入されていない場合は、チェックイン不可とし、ダイアログを表示してその旨を伝える。
1. チェックアウト前) ファイルがリポジトリ内で"共有"されている場合には、事前分岐の確認を促すダイアログを表示する。

* analyze_batch  
VSSのanayzeを実施するバッチ  
(昨日どの程度利用されたか集計、など)

* feed.php  
Subversionのlogを、RSS feedに変換するphp

* *.bat  
Subversion用のイベントハンドラのサンプル各種
