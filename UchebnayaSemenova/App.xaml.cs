﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using UchebnayaSemenova.Bases;

namespace UchebnayaSemenova
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static UchebnayaSemenovaEntities1 db = new UchebnayaSemenovaEntities1();
        public static bool isAdmin = false;
        internal static bool isEmployee;
        internal static bool isStudent;
        //public static int userNumber;
    }
}
