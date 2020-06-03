Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82C471ECCB7
	for <lists+kernel-janitors@lfdr.de>; Wed,  3 Jun 2020 11:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgFCJjo (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 3 Jun 2020 05:39:44 -0400
Received: from stargate.chelsio.com ([12.32.117.8]:44367 "EHLO
        stargate.chelsio.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgFCJjo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Jun 2020 05:39:44 -0400
Received: from [10.193.177.165] (sicon-nithya-lt.asicdesigners.com [10.193.177.165] (may be forged))
        by stargate.chelsio.com (8.13.8/8.13.8) with ESMTP id 0539db3c003822;
        Wed, 3 Jun 2020 02:39:38 -0700
Subject: Re: [bug report] crypto/chtls: IPv6 support for inline TLS
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
References: <20200603090637.GA1760819@mwanda>
From:   Vinay Kumar Yadav <vinay.yadav@chelsio.com>
Message-ID: <95b9547e-baea-54f6-5fa3-311dad9f578b@chelsio.com>
Date:   Wed, 3 Jun 2020 15:12:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200603090637.GA1760819@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

I will be fixing it in my next patch.
Thanks for pointing out.

On 6/3/2020 2:36 PM, Dan Carpenter wrote:
> Hello Vinay Kumar Yadav,
> 
> The patch 6abde0b24122: "crypto/chtls: IPv6 support for inline TLS"
> from Jun 2, 2020, leads to the following static checker warning:
> 
> 	drivers/crypto/chelsio/chtls/chtls_cm.c:110 chtls_find_netdev()
> 	warn: inconsistent indenting
> 
> drivers/crypto/chelsio/chtls/chtls_cm.c
>      92  static struct net_device *chtls_find_netdev(struct chtls_dev *cdev,
>      93                                              struct sock *sk)
>      94  {
>      95          struct net_device *ndev = cdev->ports[0];
>      96          struct net_device *temp;
>      97          int addr_type;
>      98
>      99          switch (sk->sk_family) {
>     100          case PF_INET:
>     101                  if (likely(!inet_sk(sk)->inet_rcv_saddr))
>     102                          return ndev;
>     103                  ndev = ip_dev_find(&init_net, inet_sk(sk)->inet_rcv_saddr);
>     104                  break;
>     105          case PF_INET6:
>     106                  addr_type = ipv6_addr_type(&sk->sk_v6_rcv_saddr);
>     107                  if (likely(addr_type == IPV6_ADDR_ANY))
>     108                          return ndev;
>     109
>     110          for_each_netdev_rcu(&init_net, temp) {
> 
> Probably this should be indented another tab.
> 
>     111                  if (ipv6_chk_addr(&init_net, (struct in6_addr *)
>     112                                    &sk->sk_v6_rcv_saddr, temp, 1)) {
>     113                          ndev = temp;
>     114                          break;
>     115                  }
>     116          }
>     117          break;
>     118          default:
>     119                  return NULL;
>     120          }
>     121
>     122          if (!ndev)
>     123                  return NULL;
>     124
>     125          if (is_vlan_dev(ndev))
>     126                  return vlan_dev_real_dev(ndev);
>     127          return ndev;
>     128  }
> 
> regards,
> dan carpenter
> 
