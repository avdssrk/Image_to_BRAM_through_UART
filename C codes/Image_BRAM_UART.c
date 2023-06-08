
#include <windows.h>
#include <stdio.h>
#include <time.h>
#include <string.h>

#define MAX_LINE_LENGTH 3138
#define MAX_COLUMNS 785


void pauseS(unsigned int seconds){
    unsigned int msec = seconds*1000;
    clock_t start_time = clock();

    while((clock()-start_time)<msec)
        continue;
}

int main()
{
    int i=0;
    char data[2];


    // reading the data from the .txt file

    FILE *file;
    char line[MAX_LINE_LENGTH];
    int data_txt[MAX_COLUMNS];
    int numColumns;
    int Write_flag;
    Write_flag=0;
    file = fopen("mnist_1.txt", "r");
    if (file == NULL) {
        printf("Error opening the file.\n");
        return 1;
    }

    while (fgets(line, sizeof(line), file) != NULL) {
        numColumns = 0;
        char *token = strtok(line, "\t"); // Split line by tab space

        while (token != NULL && numColumns < MAX_COLUMNS) {
            data_txt[numColumns] = atoi(token); // Convert token to integer
            numColumns++;
            token = strtok(NULL, "\t");
        }
    }

    fclose(file);




    // Declare variables and structures
    HANDLE hSerial;
    DCB dcbSerialParams = {0};
    COMMTIMEOUTS timeouts = {0};
    DWORD bytesRead;
    // Open the highest available serial port number
    fprintf(stderr, "Opening serial port...");
    hSerial = CreateFile(
                "\COM4", GENERIC_READ|GENERIC_WRITE, 0, NULL,
                OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL );
    if (hSerial == INVALID_HANDLE_VALUE)
    {
            fprintf(stderr, "Error\n");
            return 1;
    }
    else fprintf(stderr, "OK\n");

    // Set device parameters (38400 baud, 1 start bit,
    // 1 stop bit, no parity)
    dcbSerialParams.DCBlength = sizeof(dcbSerialParams);
    if (GetCommState(hSerial, &dcbSerialParams) == 0)
    {
        fprintf(stderr, "Error getting device state\n");
        CloseHandle(hSerial);
        return 1;
    }

    dcbSerialParams.BaudRate = CBR_115200;
    dcbSerialParams.ByteSize = 8;
    dcbSerialParams.StopBits = ONESTOPBIT;
    dcbSerialParams.Parity = NOPARITY;
    if(SetCommState(hSerial, &dcbSerialParams) == 0)
    {
        fprintf(stderr, "Error setting device parameters\n");
        CloseHandle(hSerial);
        return 1;
    }

    // Set COM port timeout settings
    timeouts.ReadIntervalTimeout = 0;
    timeouts.ReadTotalTimeoutConstant = 1;
    timeouts.ReadTotalTimeoutMultiplier = 1;
    timeouts.WriteTotalTimeoutConstant = 1;
    timeouts.WriteTotalTimeoutMultiplier = 1;
    if(SetCommTimeouts(hSerial, &timeouts) == 0)
    {
        fprintf(stderr, "Error setting timeouts\n");
        CloseHandle(hSerial);
        return 1;
    }


    // Send specified text (remaining command line arguments)
    DWORD bytes_written, total_bytes_written = 0;
    fprintf(stderr, "Sending bytes...");
    printf("Num cols : %d\n",numColumns);

    for(i=0;i<numColumns;){
        ReadFile(hSerial, data, sizeof(data) - 1, &bytesRead, NULL);

        data[bytesRead] = '\0';
        //printf("Received data: %s\n", data);

        if(atoi(data)==3){      // getting multiple 3s??
            Write_flag=1;
            data[bytesRead-2]='\0';
        }


        if(Write_flag==1){
            WriteFile(hSerial, data_txt+i, 1, &bytes_written, NULL);
            i++;
            //Sleep(100);
            //pauseS(1);
        }
        /*
        if((i>0)&&((i)%4==0)){
            Write_flag=0;
            //i++;
        }
        */

        //printf("i = %d, Write flag=%d\n",i,Write_flag);
        //pauseS(1);

    }

    //fprintf(stderr, "%d bytes written\n", bytes_written);

    // Close serial port
    fprintf(stderr, "Closing serial port...");
    if (CloseHandle(hSerial) == 0)
    {
        fprintf(stderr, "Error\n");
        return 1;
    }
    fprintf(stderr, "OK\n");

    // exit normally
    return 0;
}
