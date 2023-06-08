# Image_to_BRAM_through_UART
This is about how to transfer the image of 28x28 size to FPGA through UART serial port. The transferred image will be stored in a BRAM.

Detailed explanation about the UART on FPGA can be found [here](https://github.com/avdssrk/UART_Virtex6).

The output of the CMD after transmitting one complete image is shown below.

<p align="center">
  <img src="https://github.com/avdssrk/Image_to_BRAM_through_UART/blob/main/images/output_cmd.png" width="1000" title="output">
</p>


# Sending data through Tera Term MACRO
Instead of writing the code in C to send the data, there is another option to send the data through Tera Term. We use the Macros in Tera term to send the data. For that you need to write the macro(.ttl) scripts. This method is fast compared to the previous method.

<p align="center">
  <img src="https://github.com/avdssrk/Image_to_BRAM_through_UART/blob/main/images/BRAM_tera_term.png" width="1300" title="output">
</p>

The time taken to send 10 images to approx 2 secs, whereas in previous method to send 1 image it is taking 2 secs.
