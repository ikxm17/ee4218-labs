import serial
import csv

# --- Configuration ---
SERIAL_PORT = '/dev/ttyUSB1'  
BAUD_RATE = 115200
OUTPUT_FILE = 'RES.csv'
BYTES_TO_READ = 100  

def capture_uart_to_csv():
    try:
        # Initialize Serial Port
        ser = serial.Serial(SERIAL_PORT, BAUD_RATE, timeout=2)
        print(f"Listening on {SERIAL_PORT}... (Press Ctrl+C to stop)")

        captured_count = 0
        
        with open(OUTPUT_FILE, mode='w', newline='') as file:
            writer = csv.writer(file)
            # Optional: Add a header
            writer.writerow(['Value_Decimal', 'Value_Hex'])

            while captured_count < BYTES_TO_READ:
                # Read 1 byte from the FPGA
                raw_byte = ser.read(1)
                
                if raw_byte:
                    # Convert byte to integer
                    int_val = int.from_bytes(raw_byte, byteorder='big')
                    hex_val = raw_byte.hex().upper()
                    
                    # Write to CSV
                    writer.writerow([int_val, f"0x{hex_val}"])
                    
                    print(f"Received: {int_val} (0x{hex_val})")
                    captured_count += 1
                else:
                    print("Timeout: No data received from FPGA.")
                    break

        print(f"\nSuccess: {captured_count} bytes saved to {OUTPUT_FILE}")
        ser.close()

    except serial.SerialException as e:
        print(f"Serial Error: {e}")
    except KeyboardInterrupt:
        print("\nCapture stopped by user.")

if __name__ == "__main__":
    capture_uart_to_csv()