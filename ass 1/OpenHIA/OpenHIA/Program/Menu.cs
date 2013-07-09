﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OpenHIA.Program
{
    class Menu
    {

        /// <summary>
        /// Display the first menu when user starts the program
        /// including either testin the program or go directly to it
        /// </summary>
        public void DisplayStartMenu()
        {
            Console.WriteLine("1. Start the program");
            Console.WriteLine("2. Test the program");
            Console.WriteLine("3. Exit");
            Console.Write("Please choose an option: ");
        }

        /// <summary>
        /// Display the main menu of the system
        /// </summary>
        public void DisplayMainMenu()
        {
            Console.WriteLine("1. Doctors CRUD");
            Console.WriteLine("2. Patients CRUD");
            Console.WriteLine("3. Hospital CRUD");
            Console.WriteLine("4. Visit CRUD");
            Console.WriteLine("5. Exit");
            Console.Write("Please choose an option: ");
        }

        public void DisplayDoctorOption()
        {
            Console.WriteLine("1. Add new doctor");
            Console.WriteLine("2. Edit doctor");
            Console.WriteLine("3. Delete doctor");
            Console.WriteLine("4. Display all doctors");
            Console.WriteLine("5. Back");
            Console.Write("Please choose an option: ");
        }

        public void DisplayPatientOption()
        {
            Console.WriteLine("1. Add new patient");
            Console.WriteLine("2. Edit patient");
            Console.WriteLine("3. Delete patient");
            Console.WriteLine("4. Display all patients");
            Console.WriteLine("5. Back");
            Console.Write("Please choose an option: ");
        }

        public void DisplayHospitalOption()
        {
            Console.WriteLine("1. Add new hospital");
            Console.WriteLine("2. Edit hospital");
            Console.WriteLine("3. Delete hospital");
            Console.WriteLine("4. Display all hospitals");
            Console.WriteLine("5. Back");
            Console.Write("Please choose an option: ");
        }

        /// <summary>
        public void DisplayVisitOption()
        {
            Console.WriteLine("1. Ada new visit");
            Console.WriteLine("2. Edit visit");
            Console.WriteLine("3. Delete visit");
            Console.WriteLine("4. Display all visits");
            Console.WriteLine("5. Back");
            Console.Write("Please choose an option: ");
        }

        /// Display invalid input error message of the system
        /// </summary>
        public void DisplayErrorInput()
        {
            Console.Write("Invalid input. Please enter again: ");
        }
    }
}
