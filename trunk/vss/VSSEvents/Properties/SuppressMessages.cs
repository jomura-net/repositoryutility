#if CODE_ANALYSIS
using System.Diagnostics.CodeAnalysis;

/*
 * �R�[�h��͂̎w�E����
 */


// ������"Jomura"�̎����`�F�b�N
[module: SuppressMessage("Microsoft.Naming", "CA1704:IdentifiersShouldBeSpelledCorrectly", MessageId = "Jomura")]
[module: SuppressMessage("Microsoft.Naming", "CA1704:IdentifiersShouldBeSpelledCorrectly", Scope = "namespace", Target = "Jomura.VisualStudio.SourceSafe.Interop", MessageId = "Jomura")]

// ������"VSS"��Case
[module: SuppressMessage("Microsoft.Naming", "CA1709:IdentifiersShouldBeCasedCorrectly", MessageId = "VSS")]
[module: SuppressMessage("Microsoft.Naming", "CA1709:IdentifiersShouldBeCasedCorrectly", Scope = "type", Target = "Jomura.VisualStudio.SourceSafe.Interop.VSSEvents", MessageId = "VSS")]

// �E���獶�ւ̓ǂݎ�菇�����g�p����J���`�������ɃR�[�h ���C�u���������[�J���C�Y���Ȃ��ꍇ�́A���̋K���ɂ��x����}�����Ă����S�ł��B
[module: SuppressMessage("Microsoft.Globalization", "CA1300:SpecifyMessageBoxOptions", Scope = "member", Target = "Jomura.VisualStudio.SourceSafe.Interop.VSSEvents.#BeforeCheckin(Microsoft.VisualStudio.SourceSafe.Interop.VSSItem,System.String,System.String)")]
[module: SuppressMessage("Microsoft.Globalization", "CA1300:SpecifyMessageBoxOptions", Scope = "member", Target = "Jomura.VisualStudio.SourceSafe.Interop.VSSEvents.#BeforeCheckout(Microsoft.VisualStudio.SourceSafe.Interop.VSSItem,System.String,System.String)")]


#endif
