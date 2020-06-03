Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C80461ECC29
	for <lists+kernel-janitors@lfdr.de>; Wed,  3 Jun 2020 11:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbgFCJIt (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 3 Jun 2020 05:08:49 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:33900 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgFCJIs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Jun 2020 05:08:48 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05392URZ040210;
        Wed, 3 Jun 2020 09:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=QELrRE/Zjg/egEwXR9WnAl9HguDWwpv1bMtlSR2U0nc=;
 b=GA1we462FcRcdPIUFtPyLOtsTw7vtd6Ery7fB6vuDHwE5DIL9sGa7Xu3XiyA31aj8FR0
 tFHjW7yusC1WtryoDqtsSuqDNAV1kssSpFJRBSf4uxHe+U3ZfKqtFMC8FC/UYh6gOvEG
 qmAO/wDvti/H8ZNhcJfD30UWK/bZe13YJpji2WrcDtnXhdR8Q13z0KreLEyzmsEiSnTK
 U/Pl0mTqv5vaXNWZvsNhQt4H1Miai6vaVnF6lBetjas7JXvI4+InMfiQf/uCZeNPghmr
 SOfOnQO6/otTPBovhMCmsAf01EiGh58EmOhM3HFKTiIMf1yyDTdCvkF1vEA75fA0IQ4f RQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 31bfem85ar-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 03 Jun 2020 09:08:45 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 053942DY031357;
        Wed, 3 Jun 2020 09:06:44 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 31dju2x7d3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 03 Jun 2020 09:06:44 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 05396h6M029781;
        Wed, 3 Jun 2020 09:06:43 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 03 Jun 2020 02:06:42 -0700
Date:   Wed, 3 Jun 2020 12:06:37 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     vinay.yadav@chelsio.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] crypto/chtls: IPv6 support for inline TLS
Message-ID: <20200603090637.GA1760819@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9640 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=3 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006030071
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9640 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=3
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006030071
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Vinay Kumar Yadav,

The patch 6abde0b24122: "crypto/chtls: IPv6 support for inline TLS"
from Jun 2, 2020, leads to the following static checker warning:

	drivers/crypto/chelsio/chtls/chtls_cm.c:110 chtls_find_netdev()
	warn: inconsistent indenting

drivers/crypto/chelsio/chtls/chtls_cm.c
    92  static struct net_device *chtls_find_netdev(struct chtls_dev *cdev,
    93                                              struct sock *sk)
    94  {
    95          struct net_device *ndev = cdev->ports[0];
    96          struct net_device *temp;
    97          int addr_type;
    98  
    99          switch (sk->sk_family) {
   100          case PF_INET:
   101                  if (likely(!inet_sk(sk)->inet_rcv_saddr))
   102                          return ndev;
   103                  ndev = ip_dev_find(&init_net, inet_sk(sk)->inet_rcv_saddr);
   104                  break;
   105          case PF_INET6:
   106                  addr_type = ipv6_addr_type(&sk->sk_v6_rcv_saddr);
   107                  if (likely(addr_type == IPV6_ADDR_ANY))
   108                          return ndev;
   109  
   110          for_each_netdev_rcu(&init_net, temp) {

Probably this should be indented another tab.

   111                  if (ipv6_chk_addr(&init_net, (struct in6_addr *)
   112                                    &sk->sk_v6_rcv_saddr, temp, 1)) {
   113                          ndev = temp;
   114                          break;
   115                  }
   116          }
   117          break;
   118          default:
   119                  return NULL;
   120          }
   121  
   122          if (!ndev)
   123                  return NULL;
   124  
   125          if (is_vlan_dev(ndev))
   126                  return vlan_dev_real_dev(ndev);
   127          return ndev;
   128  }

regards,
dan carpenter
