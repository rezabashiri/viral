using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;
using Kavenegar.Exceptions;

namespace CMS.CMSLogic
{
    public class SMS
    {
        const String ApiKey = "517A737A6D465A692F3569484E6C53545033426975513D3D";
        const String SenderLine = "10000400044000";


        static void Send(string receptor, string code)
        {
            code = "123";
            receptor = "09";

            string text = "با سلام \n کد ارسالی شما " + code + " می باشد.";


            try
            {
                Kavenegar.KavenegarApi api = new Kavenegar.KavenegarApi(ApiKey);

                var result = api.Send(SenderLine, receptor, text);

                if (result.Status != 200)
                {
                    Console.WriteLine(String.Format("Returned [{0}] Message:[{1}]", result.Status, result.StatusText));
                    //return null;
                }


                var smsStatus = api.Status(result.Messageid.ToString());
                Console.Write("Message : " + smsStatus.Statustext);
                //return smsStatus;

            }

            catch (ApiException ex)
            {
                // در صورتی که خروجی وب سرویس 200 نباشد این خطارخ می دهد.
                Console.Write("Message : " + ex.Message);
            }
            catch (Kavenegar.Exceptions.HttpException ex)
            {
                // در زمانی که مشکلی در برقرای ارتباط با وب سرویس وجود داشته باشد این خطا رخ می دهد
                Console.Write("Message : " + ex.Message);
            }
        }
    }
}