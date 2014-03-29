#include <stdio.h>
#include <sys/socket.h>
#include <net/ethernet.h>
#include <netpacket/packet.h>

int main(int argc, char *argv[]) {
  int packet_socket = socket(AF_PACKET, SOCK_RAW, htons(ETH_P_ALL));

  int recv_length;
  char recv_buffer[8192] = {0};

  while ((recv_length = recv(packet_socket, recv_buffer, 8192, 0)) > 0) {
    fwrite(recv_buffer, recv_length, 1, stdout);
    fflush(stdout);
  }
}
