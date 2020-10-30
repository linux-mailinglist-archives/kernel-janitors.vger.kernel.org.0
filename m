Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 214B62A0307
	for <lists+kernel-janitors@lfdr.de>; Fri, 30 Oct 2020 11:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgJ3Kja (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 30 Oct 2020 06:39:30 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:52686 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbgJ3Kja (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 30 Oct 2020 06:39:30 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09UAdMOb193563;
        Fri, 30 Oct 2020 10:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=wuwscU9WEcxsF3j2CU01JNczBEh1h05OvQtj9AFTQiM=;
 b=kFuxw/jRz5eV3+1UradmOvMl6VfMdlJqhivCneNdFuQ5Vfbl0SP7AevJQwTavkheAF4n
 RDuTfDm+ng4+MfHJ7nxdEbRPilmt5pVceKvpzLcR3Af+CABJT2ccwxoR/J4zGlkZnPhu
 7/sFql5EJ7RgGv3qO5lKj07TnVuG6O95B/zSoohFhDMyGWS11NOt7rARZcTTawoxfRmm
 1b8ovuI7S8TEnxBZZ12Oj8Q9uB32mrcgrzsFd625Obp60huBDpgrJjIJBQGroSfY0qaA
 jJQDEHRxTshWIkBdVqZrsaC7Dmx22y9EnmhjpG5G3d5lLbbnbgkujMriK5cshRWQ6Rwr qQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 34c9sb98fy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 30 Oct 2020 10:39:26 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09UAYYhC173898;
        Fri, 30 Oct 2020 10:39:26 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 34cwuqu299-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 30 Oct 2020 10:39:26 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09UAdONH000307;
        Fri, 30 Oct 2020 10:39:24 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 30 Oct 2020 03:39:23 -0700
Date:   Fri, 30 Oct 2020 13:39:18 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     vinay.yadav@chelsio.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] chelsio/chtls: Fix panic when listen on multiadapter
Message-ID: <20201030103918.GA3241259@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9789 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 suspectscore=3
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010300080
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9789 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1011 suspectscore=3
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010300081
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Vinay Kumar Yadav,

The patch 9819f22c410b: "chelsio/chtls: Fix panic when listen on
multiadapter" from Oct 19, 2020, leads to the following static
checker warning:

	drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c:137 chtls_find_netdev()
	warn: 'ndev' held on error path.

drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c
    92  static struct net_device *chtls_find_netdev(struct chtls_dev *cdev,
    93                                              struct sock *sk)
    94  {
    95          struct adapter *adap = pci_get_drvdata(cdev->pdev);
    96          struct net_device *ndev = cdev->ports[0];
                                   ^^^^^^^^^^^^^^^^^^^^^

The reference counting in this function is pretty confusing.  I would
have expected it to take a dev_hold() reference on all paths before
returning.

No dev_hold() here, though.

    97  #if IS_ENABLED(CONFIG_IPV6)
    98          struct net_device *temp;
    99          int addr_type;
   100  #endif
   101          int i;
   102  
   103          switch (sk->sk_family) {
   104          case PF_INET:
   105                  if (likely(!inet_sk(sk)->inet_rcv_saddr))
   106                          return ndev;
   107                  ndev = __ip_dev_find(&init_net, inet_sk(sk)->inet_rcv_saddr, false);

__ip_dev_find call dev_hold()

   108                  break;
   109  #if IS_ENABLED(CONFIG_IPV6)
   110          case PF_INET6:
   111                  addr_type = ipv6_addr_type(&sk->sk_v6_rcv_saddr);
   112                  if (likely(addr_type == IPV6_ADDR_ANY))
   113                          return ndev;
   114  
   115                  for_each_netdev_rcu(&init_net, temp) {
   116                          if (ipv6_chk_addr(&init_net, (struct in6_addr *)
   117                                            &sk->sk_v6_rcv_saddr, temp, 1)) {
   118                                  ndev = temp;

No dev_hold().

   119                                  break;
   120                          }
   121                  }
   122          break;
   123  #endif
   124          default:
   125                  return NULL;
   126          }
   127  
   128          if (!ndev)
   129                  return NULL;
   130  
   131          if (is_vlan_dev(ndev))
   132                  ndev = vlan_dev_real_dev(ndev);
   133  
   134          for_each_port(adap, i)
   135                  if (cdev->ports[i] == ndev)
   136                          return ndev;
                                ^^^^^^^^^^^
We're holding dev_hold() for ipv4 but not for ipv6.

   137          return NULL;
                ^^^^^^^^^^^^
Smatch complains that if we hit this for ipv4 then we're leaking a
dev_hold() reference.

   138  }

regards,
dan carpenter
