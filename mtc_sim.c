// Mais detalhes do protocolo:
// http://sasdocs.sascar.com.br/share/page/site/parser/document-details?nodeRef=workspace%3A%2F%2FSpacesStore%2F05b33b8d-b91e-4989-a21b-f1156f656697

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <string.h>
#define USAGE_MSG "Entrada inválida. Exemplo de uso: mtc_sim hom -28.451722 -58.246113"
#define IP_DESENV      "10.1.110.1" //"201.94.132.110"
#define PORTA_DESENV   10063
#define IP_HOMOL       "10.1.101.1" //"201.94.132.101"
#define PORTA_HOMOL    11063

// =============================================================================
//    Protocolo MTC
// =============================================================================

#define ML_START_FRAME     0x01
#define ML_END_FRAME       0x04
#define ML_BYTE_STUFF      0x10
#define ML_BYTE_STUFF_SUM  0x20
#define ML_OPT_CHAR_1      0x11
#define ML_OPT_CHAR_2      0x13
#define CRC_INITIAL_VALUE  0x0000
#define DATAREF_MTC600     946684800

static const unsigned int crc16_ccitt_table[256] = { 0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50a5, 0x60c6, 0x70e7, 0x8108, 0x9129, 0xa14a, 0xb16b, 0xc18c, 0xd1ad, 0xe1ce,
    0xf1ef, 0x1231, 0x0210, 0x3273, 0x2252, 0x52b5, 0x4294, 0x72f7, 0x62d6, 0x9339, 0x8318, 0xb37b, 0xa35a, 0xd3bd, 0xc39c, 0xf3ff, 0xe3de, 0x2462, 0x3443, 0x0420, 0x1401, 0x64e6,
    0x74c7, 0x44a4, 0x5485, 0xa56a, 0xb54b, 0x8528, 0x9509, 0xe5ee, 0xf5cf, 0xc5ac, 0xd58d, 0x3653, 0x2672, 0x1611, 0x0630, 0x76d7, 0x66f6, 0x5695, 0x46b4, 0xb75b, 0xa77a, 0x9719,
    0x8738, 0xf7df, 0xe7fe, 0xd79d, 0xc7bc, 0x48c4, 0x58e5, 0x6886, 0x78a7, 0x0840, 0x1861, 0x2802, 0x3823, 0xc9cc, 0xd9ed, 0xe98e, 0xf9af, 0x8948, 0x9969, 0xa90a, 0xb92b, 0x5af5,
    0x4ad4, 0x7ab7, 0x6a96, 0x1a71, 0x0a50, 0x3a33, 0x2a12, 0xdbfd, 0xcbdc, 0xfbbf, 0xeb9e, 0x9b79, 0x8b58, 0xbb3b, 0xab1a, 0x6ca6, 0x7c87, 0x4ce4, 0x5cc5, 0x2c22, 0x3c03, 0x0c60,
    0x1c41, 0xedae, 0xfd8f, 0xcdec, 0xddcd, 0xad2a, 0xbd0b, 0x8d68, 0x9d49, 0x7e97, 0x6eb6, 0x5ed5, 0x4ef4, 0x3e13, 0x2e32, 0x1e51, 0x0e70, 0xff9f, 0xefbe, 0xdfdd, 0xcffc, 0xbf1b,
    0xaf3a, 0x9f59, 0x8f78, 0x9188, 0x81a9, 0xb1ca, 0xa1eb, 0xd10c, 0xc12d, 0xf14e, 0xe16f, 0x1080, 0x00a1, 0x30c2, 0x20e3, 0x5004, 0x4025, 0x7046, 0x6067, 0x83b9, 0x9398, 0xa3fb,
    0xb3da, 0xc33d, 0xd31c, 0xe37f, 0xf35e, 0x02b1, 0x1290, 0x22f3, 0x32d2, 0x4235, 0x5214, 0x6277, 0x7256, 0xb5ea, 0xa5cb, 0x95a8, 0x8589, 0xf56e, 0xe54f, 0xd52c, 0xc50d, 0x34e2,
    0x24c3, 0x14a0, 0x0481, 0x7466, 0x6447, 0x5424, 0x4405, 0xa7db, 0xb7fa, 0x8799, 0x97b8, 0xe75f, 0xf77e, 0xc71d, 0xd73c, 0x26d3, 0x36f2, 0x0691, 0x16b0, 0x6657, 0x7676, 0x4615,
    0x5634, 0xd94c, 0xc96d, 0xf90e, 0xe92f, 0x99c8, 0x89e9, 0xb98a, 0xa9ab, 0x5844, 0x4865, 0x7806, 0x6827, 0x18c0, 0x08e1, 0x3882, 0x28a3, 0xcb7d, 0xdb5c, 0xeb3f, 0xfb1e, 0x8bf9,
    0x9bd8, 0xabbb, 0xbb9a, 0x4a75, 0x5a54, 0x6a37, 0x7a16, 0x0af1, 0x1ad0, 0x2ab3, 0x3a92, 0xfd2e, 0xed0f, 0xdd6c, 0xcd4d, 0xbdaa, 0xad8b, 0x9de8, 0x8dc9, 0x7c26, 0x6c07, 0x5c64,
    0x4c45, 0x3ca2, 0x2c83, 0x1ce0, 0x0cc1, 0xef1f, 0xff3e, 0xcf5d, 0xdf7c, 0xaf9b, 0xbfba, 0x8fd9, 0x9ff8, 0x6e17, 0x7e36, 0x4e55, 0x5e74, 0x2e93, 0x3eb2, 0x0ed1, 0x1ef0 };

unsigned short crc16_ccitt_buffer(unsigned char *data, unsigned int size)
{
        unsigned int i;
        unsigned short crc1 = CRC_INITIAL_VALUE;

    for (i = 0; i < size; ++i)
        crc1 = (crc1 << 8) ^ crc16_ccitt_table[(unsigned char)(*data++ ^ (unsigned char)(crc1 >> 8))];

    return crc1;
}

void die (char* msg)
{
    printf("%s\n\n", msg);
    exit(0);
}

// Estrutura do protocolo
typedef union union_t32_timestamp
{
    uint32_t value;
    struct struct_info
    {
        uint32_t second  :6;  /* 0 - 59 segundos */
        uint32_t minute  :6;  /* 0 - 59 minutos */
        uint32_t hour    :5;  /* 0 - 23 horas */
        uint32_t days    :15; /* number of days and 0 means 1/1/2000 */
    } info;
} t32_timestamp;

/*
time_t timestampMtcToTimestamp(t32_timestamp tempo)
{
  time_t dataHora;

  dataHora  = DATAREF_MTC600;
  dataHora += tempo.info.days * 86400;
  dataHora += tempo.info.hour * 3600;
  dataHora += tempo.info.minute * 60;
  dataHora += tempo.info.second;

  return dataHora;
}
*/

t32_timestamp timestampToTimestampMtc(time_t tempo)
{
  t32_timestamp dataHora;

  tempo = tempo - DATAREF_MTC600;

  dataHora.info.days = (int) tempo / 86400; tempo = tempo - dataHora.info.days * 86400;
  dataHora.info.hour = (int) tempo / 3600;  tempo = tempo - dataHora.info.hour * 3600;
  dataHora.info.minute = tempo / 60;        tempo = tempo - dataHora.info.minute * 60;
  dataHora.info.second = tempo;

  return dataHora;
}

// =============================================================================
//    Úteis
// =============================================================================

void printTimestamp(time_t tempo)
{
  char strDateTimeAux[128];
  struct tm *tmt;

  tmt = gmtime(&tempo);
  printf("%02d/%02d/%04d %02d:%02d:%02d",
          tmt->tm_mday,
          tmt->tm_mon + 1,
          tmt->tm_year + 1900,
          tmt->tm_hour,
          tmt->tm_min,
          tmt->tm_sec);
}

size_t hexstr_to_byte(unsigned char* raw, const char* hexstr)
{
    size_t len = strlen(hexstr);
    if (len % 2 != 0)
        return;
    size_t final_len = len / 2;

    for (size_t i=0, j=0; j<final_len; i+=2, j++)
        raw[j] = (hexstr[i] % 32 + 9) % 25 * 16 + (hexstr[i+1] % 32 + 9) % 25;

    raw[final_len] = '\0';

    return final_len;
}

// =============================================================================
//    Funções auxiliares
// =============================================================================

unsigned short calcular_crc(char* packet_in_ascii)
{
    char packet[256];
    unsigned char hex_packet[256];
    int size_hex_packet;

    strcpy(packet, packet_in_ascii);

    hexstr_to_byte(hex_packet, packet);

    size_hex_packet = strlen(packet)/2;

    // // Printing hex
    // puts("\n=== DATA INPUT TO CRC: ");
    // for (int i = 0; i < size_hex_packet; i++)
    //     printf("%02X", hex_packet[i] & 0x000000FF);
    // puts("\n");

    return crc16_ccitt_buffer(hex_packet, size_hex_packet);
}

void prepare_packet(char* out, char* pak)
{
    int j=0;

    // Header
    out[j++] = '0';
    out[j++] = '1';

    // Calculo do byte stuff (0x01, 0x04, 0x10, 0x11 e 0x13)
    for (int i=0; i+1 < strlen(pak); i+=2)
    {
        if (pak[i]=='0' && (pak[i+1]=='1' ||
                            pak[i+1]=='4'))
        {
            out[j++] = '1';
            out[j++] = '0';
            out[j++] = '2';
            out[j++] = pak[i+1];
        }
        else if (pak[i]=='1' && (pak[i+1]=='0' ||
                                 pak[i+1]=='1' ||
                                 pak[i+1]=='3'))
        {
            out[j++] = '1';
            out[j++] = '0';
            out[j++] = '3';
            out[j++] = pak[i+1];
        }
        else
        {
            out[j++] = pak[i];
            out[j++] = pak[i+1];
        }

    }

    // End
    out[j++] = '0';
    out[j++] = '4';
    out[j++] = '\0';
}
void send_packet(unsigned char* hex_packet, size_t size, char* ip, int porta)
{
    int sockfd, connfd;
    struct sockaddr_in servaddr, cli;

    // Pacote de apresentação do veículo HXA7003
    unsigned char apresentation[] = { 0x01, 0x80, 0x00, 0x84, 0x00, 0x28,
          0x4c, 0x72, 0x65, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x03, 0x10,
          0x21, 0x00, 0x6e, 0xe1, 0x58, 0x39, 0x08, 0x26, 0x36, 0x00, 0xf3,
          0xe2, 0xbd, 0x03, 0x10, 0x21, 0x00, 0x00, 0x00, 0xed, 0xf3, 0x04,
          0xF3, 0x04 };

    // socket create and verification
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd == -1)
        die("socket creation failed...");
    else
        puts("Socket successfully created...");

    bzero(&servaddr, sizeof(servaddr));

    servaddr.sin_family = AF_INET;
    servaddr.sin_addr.s_addr = inet_addr(ip);
    servaddr.sin_port = htons(porta);
    // connect the client socket to server socket
    if (connect(sockfd, (struct sockaddr*) &servaddr, sizeof(servaddr)) != 0)
        die("connection with the server failed...");
    else
        puts("connected to the server...");


    puts("Sending apresentation...");
    write(sockfd, apresentation, sizeof(apresentation));

    sleep(3);

    puts("Sending packet...");
    write(sockfd, hex_packet, size);

    // // Printing sended packet
    // puts("\n=== SENDED PACKET: ");
    // for (int i = 0; i < size; i++)
    //     printf("%02X", hex_packet[i] & 0x000000FF);
    // puts("\n");

    // // Reading answer
    // bzero(buff, sizeof(buff));
    // read(sockfd, buff, sizeof(buff));
    // printf("From Server : %s", buff);

    close(sockfd);
}

// =============================================================================
//    Main
// =============================================================================
int main (int argc, char *argv[])
{
    if (argc != 4)
        die(USAGE_MSG);

    double latitude = atof(argv[2]);
    double longitude = atof(argv[3]);
    char ip[15];
    int porta;
    
    if (strcmp(argv[1], "hom")==0){
        strcpy (ip, IP_HOMOL);
        porta = PORTA_HOMOL;
        puts ("Usando config de homologacao");
    }
    else {
        strcpy (ip, IP_DESENV);
        porta = PORTA_DESENV;
        puts ("Usando config de desenvolvimento");
    }
    printf ("IP: %s, Porta: %d\n", ip, porta);
    
    time_t agora = time(NULL);
    agora += 1 * 3600; // Aumenta 1 horas por causa do GMT
    
    printf ("Enter latitude = %f\n", latitude);
    printf ("Enter longitude = %f\n", longitude);
    printf ("Timestamp = ");
    printTimestamp(agora);
    printf (" (%d)\n", agora);
    // printf ("Enter lat: "); scanf("%lf", &latitude);
    // printf ("Enter long: "); scanf("%lf", &longitude);
    // double latitude = -28.451722;
    // double longitude = -58.246113;

    int floor_lat = latitude;
    int floor_long = longitude;
    long mtc_lat = (latitude - floor_lat) * 600000.0 + floor_lat * 1000000;
    long mtc_long = (longitude - floor_long) * 600000.0 + floor_long * 1000000;

    char out_timestamp[12];
    char out_lat[12];
    char out_long[12];

    sprintf (out_timestamp, "%08X\0", htonl(timestampToTimestampMtc(agora).value));
    sprintf (out_lat, "%08X\0", htonl(mtc_lat));
    sprintf (out_long, "%08X\0", htonl(mtc_long));

    char pak[256];
    // Alterando um pacote real do HXA7003, mudando o timestamp, lat, long e crc
    sprintf (pak, "2000240020%s%s%s56000000500000008540000288420000000000000000000053B400C0222B2A00000000007E880425000000006D6700006D1E0500E9CB88004D868800AD160000B42E00003B000000C44B8700258001001D14370D800000006D007500FF00FFCD032B2B2B00005FC7"
              , out_timestamp
              , out_lat
              , out_long);

    unsigned short out_crc = calcular_crc(pak);
    sprintf(pak + strlen(pak), "%04X\0", out_crc); // Adding CRC to packet

    printf("\n");
    printf("HEX timestamp: 0x%s\n", out_timestamp);
    printf("HEX lat: 0x%s\n", out_lat);
    printf("HEX long: 0x%s\n", out_long);
    printf("HEX crc: 0x%02X", out_crc);

    char out[256];
    prepare_packet(out, pak);

    printf("\n\b=== FINAL DATA PACKET:\n%s\n", out);

    unsigned char hex_packet[256];
    size_t size = hexstr_to_byte(hex_packet, out);
    send_packet(hex_packet, size, ip, porta);
    puts ("=== SUCESSO!");
    return 0;
}
