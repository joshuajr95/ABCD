using System;
using System.Threading;
using Microsoft.SPOT;
using Microsoft.SPOT.Hardware;
using System.Text;
using System.IO.Ports;

using CTRE.Phoenix;
using CTRE;
using CTRE.Phoenix.Controller;
using CTRE.Phoenix.MotorControl;
using CTRE.Phoenix.MotorControl.CAN;

namespace Hero_Arcade_Drive_Example
{
    public class Program
    {
        /* create a talon */
        static TalonSRX rightSlave = new TalonSRX(4);
        static TalonSRX right = new TalonSRX(3);
        static TalonSRX leftSlave = new TalonSRX(2);
        static TalonSRX left = new TalonSRX(1);

        static StringBuilder stringBuilder = new StringBuilder();

        static CTRE.Phoenix.Controller.GameController _gamepad = null;
        static System.IO.Ports.SerialPort UART = new System.IO.Ports.SerialPort(CTRE.HERO.IO.Port1.UART, 9600, System.IO.Ports.Parity.None, 8, System.IO.Ports.StopBits.One);

        /*creating a condition for ending the infinite loop if the button is pressed*/
        //public static bool sdc;

        public static void Main()
        {
            if(null == _gamepad)
                _gamepad = new GameController(UsbHostDevice.GetInstance());
            bool btn2 = _gamepad.GetButton(2);
            bool btn3 = _gamepad.GetButton(3);
            bool btn1 = _gamepad.GetButton(1);


            //Uart init
            UART.ReadTimeout = 10;
            UART.Open();
            float[] speedout = { 0, 0 };
            /* Factory Default all hardware to prevent unexpected behaviour */
            //rightSlave.ConfigFactoryDefault();
            //right.ConfigFactoryDefault();
            //leftSlave.ConfigFactoryDefault();
            //left.ConfigFactoryDefault();
            /* loop forever */
            //sdc = false;
            //Uart is opened


            while (true)
            {
                Debug.Print(ButtonCheck().ToString());
                if (ButtonCheck() == 3) {
                    ManualDrive();
                    
                }
                if (ButtonCheck() == 2) {
                    speedout = AutoDrive(speedout);
                }
                
                /* print whatever is in our string builder */
                //Debug.Print(stringBuilder.ToString());
                stringBuilder.Clear();
                /* feed watchdog to keep Salon's enabled */
                CTRE.Phoenix.Watchdog.Feed();
                /* run this task every 20ms */
                //Thread.Sleep(20);/
            }

        }
        /**
         * If value is within 10% of center, clear it.
         * @param value [out] floating point value to deadband.
         */
        static void Deadband(ref float value)
        {
            if (value < -0.10)
            {
                /* outside of deadband */
            }
            else if (value > +0.10)
            {
                /* outside of deadband */
            }
            else
            {
                /* within 10% so zero it */
                value = 0;
            }
        }


        //A function for manual driving using the gamepad as default
        static void ManualDrive()
        {
            if (null == _gamepad)
            {
                _gamepad = new CTRE.Phoenix.Controller.GameController(UsbHostDevice.GetInstance());
            }

            //variables for controller
            float x = _gamepad.GetAxis(0);
            float y = -1 * _gamepad.GetAxis(1);
            float twist = _gamepad.GetAxis(2);

            Deadband(ref x);
            Deadband(ref y);
            Deadband(ref twist);


            float leftThrotm = y + twist;
            float rightThrotm = y - twist;

            //while loop for manual drive
            //when button 2 is pressed, manual drive is engaged, button two is A on the controller
            /* drive robot using gamepad */
            left.Set(ControlMode.PercentOutput, leftThrotm);
            leftSlave.Set(ControlMode.PercentOutput, leftThrotm);
            right.Set(ControlMode.PercentOutput, -rightThrotm);
            rightSlave.Set(ControlMode.PercentOutput, -rightThrotm);
        }
        static float[] AutoDrive(float[] speedout) {
            /* drive robot autimatically */
            float leftThrot;
            float rightThrot;

            /*drive robot autimatically */
            float[] speedout_new = { 0, 0 };
            speedout_new = UARTRead(UART);

            if (speedout_new != null)
            {
                speedout[0] = speedout_new[0];
                speedout[1] = speedout_new[1];
            }

            leftThrot = speedout[0];
            rightThrot = speedout[1];

            left.Set(ControlMode.PercentOutput, -rightThrot);
            leftSlave.Set(ControlMode.PercentOutput, -rightThrot);
            right.Set(ControlMode.PercentOutput, leftThrot);
            rightSlave.Set(ControlMode.PercentOutput, leftThrot);
            return speedout;
        }
   
        //A function to read from UART Port 4, reading two bits and then translating that into speed of left and right
        static float[] UARTRead(System.IO.Ports.SerialPort uart)
        {
            int read_count = 0;
            byte[] rx_data = new byte[1];
            byte[] left = { 0, 0, 0, 0 };
            byte[] right = { 0, 0, 0, 0 };
            float l, lp, leftacc = 0.0f;
            float r, rp, rightacc = 0.0f;

            uart.Flush();
            read_count = uart.Read(rx_data, 0, rx_data.Length);
            if (rx_data[0].ToString() == "1")
            {
                uart.Read(rx_data, 0, rx_data.Length);
                left[0] = rx_data[0];
                
                uart.Read(rx_data, 0, rx_data.Length);
                right[0] = rx_data[0];
            }
            else
            {
                uart.Flush();
                return null;
            }

            if (left[0] != 0)
            {
                l = BitConverter.ToUInt32(left, 0);
                lp = l / 128;
                leftacc = lp - 1;
            }

            if (right[0] != 0)
            {
                r = BitConverter.ToUInt32(right, 0);
                rp = r / 128;
                rightacc = rp - 1;
            }


            //Debug.Print(left[0].ToString());
            //Debug.Print(right[0].ToString());

            float[] speedout = { leftacc, rightacc };
            string lst = "left accel: ";
            string rst = "right accel: ";
            Debug.Print(lst.ToString());
            Debug.Print(leftacc.ToString());
            Debug.Print(rst.ToString());
            Debug.Print(rightacc.ToString());
            return speedout;
        }
        static int ButtonCheck() {
            if (null == _gamepad)
                _gamepad = new GameController(UsbHostDevice.GetInstance());
            bool btn2 = _gamepad.GetButton(2);
            bool btn3 = _gamepad.GetButton(3);
            bool btn1 = _gamepad.GetButton(1);

            bool last1 = false, last2 = false, last3 = false ;
            
            if (last2 != btn2)
            {
                last2 = btn2;
                if (last1 != btn1) 
                {
                    last1 = btn1;
                    return 1;
                }
                if (last3 != btn3)
                {
                    last3 = btn3;
                    return 2;
                }
            }
            return 3;
        }
        }
    }
    
