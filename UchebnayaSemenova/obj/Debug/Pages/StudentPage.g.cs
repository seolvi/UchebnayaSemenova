﻿#pragma checksum "..\..\..\Pages\StudentPage.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "B2E05F5B172A8B958B673907992364EE982EE7C5710754A57040FA0B4C8FCF3E"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;
using UchebnayaSemenova.Pages;


namespace UchebnayaSemenova.Pages {
    
    
    /// <summary>
    /// StudentPage
    /// </summary>
    public partial class StudentPage : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 20 "..\..\..\Pages\StudentPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox SortList;
        
        #line default
        #line hidden
        
        
        #line 27 "..\..\..\Pages\StudentPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox FiltrList;
        
        #line default
        #line hidden
        
        
        #line 36 "..\..\..\Pages\StudentPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox SearchTb;
        
        #line default
        #line hidden
        
        
        #line 41 "..\..\..\Pages\StudentPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ListView StudentP;
        
        #line default
        #line hidden
        
        
        #line 45 "..\..\..\Pages\StudentPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.GridViewColumn StudentColumn;
        
        #line default
        #line hidden
        
        
        #line 46 "..\..\..\Pages\StudentPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.GridViewColumn DiciplineColumn;
        
        #line default
        #line hidden
        
        
        #line 47 "..\..\..\Pages\StudentPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.GridViewColumn MarkColumn;
        
        #line default
        #line hidden
        
        
        #line 48 "..\..\..\Pages\StudentPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.GridViewColumn DateColumn;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/UchebnayaSemenova;component/pages/studentpage.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Pages\StudentPage.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.SortList = ((System.Windows.Controls.ComboBox)(target));
            
            #line 20 "..\..\..\Pages\StudentPage.xaml"
            this.SortList.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.SortList_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 2:
            this.FiltrList = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 3:
            this.SearchTb = ((System.Windows.Controls.TextBox)(target));
            return;
            case 4:
            this.StudentP = ((System.Windows.Controls.ListView)(target));
            return;
            case 5:
            this.StudentColumn = ((System.Windows.Controls.GridViewColumn)(target));
            return;
            case 6:
            this.DiciplineColumn = ((System.Windows.Controls.GridViewColumn)(target));
            return;
            case 7:
            this.MarkColumn = ((System.Windows.Controls.GridViewColumn)(target));
            return;
            case 8:
            this.DateColumn = ((System.Windows.Controls.GridViewColumn)(target));
            return;
            }
            this._contentLoaded = true;
        }
    }
}

