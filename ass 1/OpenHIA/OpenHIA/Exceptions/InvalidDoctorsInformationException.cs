﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OpenHIA.Exceptions
{
    class InvalidDoctorsInformationException : Exception
    {
        public InvalidDoctorsInformationException(string msg)
            : base(msg)
        {

        }
    }
}
