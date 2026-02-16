import serial
import csv
import time

# --- Configuration ---
SERIAL_PORT = '/dev/ttyUSB1'  # Change to /dev/ttyUSB0 on Linux
BAUD_RATE = 115200    # Must match your FPGA UART configuration
CSV_FILE = 'A.csv'
TIMEOUT = 1           # Seconds

def send_csv_to_fpga():
    try:
        # Initialize Serial Port
        # 
        ser = serial.Serial(SERIAL_PORT, BAUD_RATE, timeout=TIMEOUT)
        print(f"Connected to {SERIAL_PORT} at {BAUD_RATE} baud.")

        with open(CSV_FILE, mode='r') as file:
            reader = csv.reader(file)
            
            for row in reader:
                for item in row:
                    # Convert string data to bytes
                    # Adjust encoding or conversion based on your CSV content
                    data_to_send = int(item).to_bytes(1, byteorder='big')
                    
                    ser.write(data_to_send)
                    
                    # # Optional: Small delay to prevent overwhelming the FPGA RX FIFO
                    # # if you aren't using hardware flow control.
                    # time.sleep(0.001) 
                
        print("Transfer Complete.")
        ser.close()

    except FileNotFoundError:
        print(f"Error: {CSV_FILE} not found.")
    except serial.SerialException as e:
        print(f"Serial Error: {e}")
    except ValueError:
        print("Error: Ensure CSV contains only integers (0-255) for 1-byte transfer.")

if __name__ == "__main__":
    send_csv_to_fpga()