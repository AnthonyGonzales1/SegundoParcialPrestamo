﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;

namespace DAL
{
    public class Contexto : DbContext
    {
        public DbSet<Cuentas> Cuenta { get; set; }
        public DbSet<Depositos> Deposito { get; set; }
        public Contexto() : base("ConStr")
        {

        }
    }
}
