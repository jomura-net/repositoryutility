#if CODE_ANALYSIS
using System.Diagnostics.CodeAnalysis;

/*
 * コード解析の指摘解除
 */


// 文字列"Jomura"の辞書チェック
[module: SuppressMessage("Microsoft.Naming", "CA1704:IdentifiersShouldBeSpelledCorrectly", MessageId = "Jomura")]
[module: SuppressMessage("Microsoft.Naming", "CA1704:IdentifiersShouldBeSpelledCorrectly", Scope = "namespace", Target = "Jomura.VisualStudio.SourceSafe.Interop", MessageId = "Jomura")]

// 文字列"VSS"のCase
[module: SuppressMessage("Microsoft.Naming", "CA1709:IdentifiersShouldBeCasedCorrectly", MessageId = "VSS")]
[module: SuppressMessage("Microsoft.Naming", "CA1709:IdentifiersShouldBeCasedCorrectly", Scope = "type", Target = "Jomura.VisualStudio.SourceSafe.Interop.VSSEvents", MessageId = "VSS")]

// 右から左への読み取り順序を使用するカルチャ向けにコード ライブラリをローカライズしない場合は、この規則による警告を抑制しても安全です。
[module: SuppressMessage("Microsoft.Globalization", "CA1300:SpecifyMessageBoxOptions", Scope = "member", Target = "Jomura.VisualStudio.SourceSafe.Interop.VSSEvents.#BeforeCheckin(Microsoft.VisualStudio.SourceSafe.Interop.VSSItem,System.String,System.String)")]
[module: SuppressMessage("Microsoft.Globalization", "CA1300:SpecifyMessageBoxOptions", Scope = "member", Target = "Jomura.VisualStudio.SourceSafe.Interop.VSSEvents.#BeforeCheckout(Microsoft.VisualStudio.SourceSafe.Interop.VSSItem,System.String,System.String)")]


#endif
