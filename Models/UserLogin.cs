using System;
using System.ComponentModel.DataAnnotations;

namespace ServiceManager.Models
{
    public class UserLogin
    {
        [Required]
        [Display(Name="Логин:")]
        public string UserName { get; set; }
        [Required]
        [Display(Name = "Пароль:")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

    }

    public class UserLoginConfirm: UserLogin
    {
        [Required]
        [Display(Name="Логин:")]
        public new string UserName { get; set; }
        [Required]
        [Display(Name = "Пароль:")]
        [DataType(DataType.Password)]
        public new string Password { get; set; }
        [Display(Name = "Подтвердите пароль:")]
        [DataType(DataType.Password)]
        [Compare("Password", ErrorMessage = "Пароли не совпадают")]
        public string ConfirmPassword { get; set; }

    }
}