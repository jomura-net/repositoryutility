using System;
using System.Runtime.InteropServices;
using System.Runtime.InteropServices.ComTypes;
using System.Windows.Forms;
using Microsoft.VisualStudio.SourceSafe.Interop;

namespace Jomura.VisualStudio.SourceSafe.Interop
{
    /// <summary>
    /// [VSS AddIn] 各種イベントハンドラ
    /// 
    /// 参考URL： http://msdn.microsoft.com/ja-jp/library/hcdf9zk2(VS.80).aspx
    /// </summary>
    [ProgId("Jomura.SourceSafe.VSSEvents")]
    [Guid("E1916BD8-A8AA-47b7-A862-C1AF995E64EF")]
    [ComVisible(true)]
    public class VSSEvents : IVSSEventHandler, IVSSEvents
    {
        //VSSApp vssApp;
        IConnectionPoint vssEvents;
        int cookie;

        #region IVSSEventHandler メンバ

        public void Init(VSSApp pIVSS)
        {
            //MessageBox.Show("VSSアドインが適用されています。");

            // by saving the VSSApp pointer you can drive the database during events
            //this.vssApp = pIVSS;

            // Wire up the COM connection point manually
            IConnectionPointContainer cpc = (IConnectionPointContainer)pIVSS;
            Guid guid = typeof(IVSSEvents).GUID;
            cpc.FindConnectionPoint(ref guid, out vssEvents);
            vssEvents.Advise(this, out cookie);
        }

        #endregion

        #region IVSSEvents メンバ

        public void AfterAdd(VSSItem pIItem, string Local, string Comment)
        {
        }

        public void AfterBranch(VSSItem pIItem, string Comment)
        {
        }

        public void AfterCheckin(VSSItem pIItem, string Local, string Comment)
        {
        }

        public void AfterCheckout(VSSItem pIItem, string Local, string Comment)
        {
        }

        public void AfterEvent(int iEvent, VSSItem pIItem, string Str, object var)
        {
        }

        public void AfterRename(VSSItem pIItem, string OldName)
        {
        }

        public void AfterUndoCheckout(VSSItem pIItem, string Local)
        {
        }

        public bool BeforeAdd(VSSItem pIPrj, string Local, string Comment)
        {
            return true;
        }

        public bool BeforeBranch(VSSItem pIItem, string Comment)
        {
            return true;
        }

        /// <summary>
        /// チェックイン前のイベントハンドラ
        /// 
        /// チェックインコメントが記入されていない場合は、
        /// チェックイン不可とし、
        /// ダイアログを表示してその旨を伝える。
        /// </summary>
        /// <param name="pIItem"></param>
        /// <param name="Local"></param>
        /// <param name="Comment"></param>
        /// <returns></returns>
        public bool BeforeCheckin(VSSItem pIItem, string Local, string Comment)
        {
            if (null != Comment)
            {
                Comment = Comment.Trim();
            }
            if (string.IsNullOrEmpty(Comment))
            {
                MessageBox.Show("チェックインコメントを記入してください。");
                return false;
            }
            return true;
        }

        /// <summary>
        /// チェックアウト前のイベントハンドラ
        /// 
        /// ファイルがリポジトリ内で"共有"されている場合には、
        /// 事前分岐の確認を促すダイアログを表示する。
        /// </summary>
        /// <param name="pIItem"></param>
        /// <param name="Local"></param>
        /// <param name="Comment"></param>
        /// <returns></returns>
        public bool BeforeCheckout(VSSItem pIItem, string Local, string Comment)
        {
            if (pIItem.Links.Count != 1)
            {
                // ファイルが共有されている場合
                DialogResult result = MessageBox.Show(
                    pIItem.Name + "は共有されています。\n分岐せずに、チェックアウトしますか？"
                    , "共有ファイルのチェックアウト確認", MessageBoxButtons.YesNo);
                if (result == DialogResult.No)
                {
                    return false;
                }
            }
            return true;
        }

        public bool BeforeEvent(int iEvent, VSSItem pIItem, string Str, object var)
        {
            return true;
        }

        public bool BeforeRename(VSSItem pIItem, string NewName)
        {
            return true;
        }

        public bool BeforeUndoCheckout(VSSItem pIItem, string Local)
        {
            return true;
        }

        public bool BeginCommand(int unused)
        {
            return true;
        }

        public void EndCommand(int unused)
        {
        }

        #endregion
    }
}
