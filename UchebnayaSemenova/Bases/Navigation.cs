using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace UchebnayaSemenova.Bases
{

    static class Navigation
    {
        private static List<PageComponent> components = new List<PageComponent>();
        public static MainWindow mainWindow;

        public static void ClearHistory()
        {
            App.isAdmin = false;
            components.Clear();
        }

        private static void Update(PageComponent pageComponent)
        {
            mainWindow.MainFrame.Navigate(pageComponent.Page);
        }
        public static void NextPage(PageComponent pageComponent)
        {
            components.Add(pageComponent);
            Update(pageComponent);

        }
    }

    class PageComponent
    {
        public string Title { get; set; }
        public Page Page { get; set; }
        public PageComponent(string title, Page page)
        {
            Title = title;
            Page = page;
        }
    }
}
