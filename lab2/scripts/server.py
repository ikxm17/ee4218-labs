import serial
import csv
import time

# --- Configuration ---
SERIAL_PORT = '/dev/ttyUSB1'  
BAUD_RATE = 115200    
INPUT_CSV = 'AB.csv'
OUTPUT_CSV = 'RES.csv'
TIMEOUT = 5              # Increased timeout to wait for FPGA processing
OUTPUT_BYTES = 2        # Number of bytes expected back

def send_and_receive_fpga():
    try:
        # Initialize Serial Port
        ser = serial.Serial(SERIAL_PORT, BAUD_RATE, timeout=TIMEOUT)
        print(f"Connected to {SERIAL_PORT} at {BAUD_RATE} baud.")

        # --- Phase 1: Sending Data ---
        with open(INPUT_CSV, mode='r') as file:
            reader = csv.reader(file)
            for row in reader:
                for item in row:
                    data_to_send = int(item).to_bytes(1, byteorder='big')
                    ser.write(data_to_send)
        
        print("Transfer to FPGA Complete. Waiting for 'Res'...")

        # --- Phase 2: Receiving Data ---
        # Read the specific number of bytes
        raw_payload = ser.read(OUTPUT_BYTES)
        
        if len(raw_payload) < OUTPUT_BYTES:
            print(f"Warning: Only received {len(raw_payload)}/{OUTPUT_BYTES} bytes.")

        # Convert bytes to Hex strings
        hex_data = [f"0x{b:02X}" for b in raw_payload]

        # Save to CSV
        with open(OUTPUT_CSV, mode='w', newline='') as outfile:
            writer = csv.writer(outfile)
            writer.writerow(hex_data) # Saves as a single row of hex values

        print(f"Success: {len(hex_data)} bytes saved to {OUTPUT_CSV}")
        ser.close()

    except FileNotFoundError:
        print(f"Error: {INPUT_CSV} not found.")
    except serial.SerialException as e:
        print(f"Serial Error: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    send_and_receive_fpga()