Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4038C1C672
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 May 2019 11:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbfENJzm (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 May 2019 05:55:42 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:44258 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbfENJzm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 May 2019 05:55:42 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4E9tTai125417;
        Tue, 14 May 2019 09:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=KWLVcI8iLNj1YvYi0ubnDCb0A8yHvEtqQLgZeh1h1tw=;
 b=oti7wFis5+OtFOrgouCz9+oC2uK2N0f0OEQZBNnMGPkIpRClg5JvHyd1JxSBa29T4VTh
 POqHbEi4KE8Zx4Pwcj/MmZglexzjAnnHxSPI15V1210JR+/Pv760kqi1WbbA8NYWU8HH
 k+FASugcykkqTLdFyg1tkva2ImZ+nn1d7q5flo9lwIh8J0+w3ZISKVwzAm85zJ9sC7r2
 iH0pUdRI2zeZ5/UaXRje/vo94/0y9kSRfm9ESD6sj2PvOhERrd2a/4tN1EGCHEQWfqI7
 95YAB/3JvRah8IylkEyS2suOBtfb7R8M/4HjlfTDbazV1jj6rP9y7guOfs5C74BBVh9G Pw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2sdnttmt09-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 May 2019 09:55:39 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4E9tcFG187647;
        Tue, 14 May 2019 09:55:38 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 2sdnqjf8nx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 May 2019 09:55:38 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4E9tcrY016708;
        Tue, 14 May 2019 09:55:38 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 14 May 2019 09:55:37 +0000
Date:   Tue, 14 May 2019 12:55:32 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     m-karicheri2@ti.com
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] net: netcp: Add Keystone NetCP core ethernet driver
Message-ID: <20190514095531.GP16030@kadam>
References: <20190514094921.GA27527@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514094921.GA27527@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9256 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905140072
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9256 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905140072
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Oh crap, this is from 4 years ago.  Never mind.  I try to not send
emails for stuff that's over a couple years old but I didn't notice the
date here.

regards,
dan carpenter

On Tue, May 14, 2019 at 12:49:21PM +0300, Dan Carpenter wrote:
> Hello Karicheri, Muralidharan,
> 
> The patch 84640e27f230: "net: netcp: Add Keystone NetCP core ethernet
> driver" from Jan 15, 2015, leads to the following static checker
> warning:
> 
> 	drivers/net/ethernet/ti/netcp_core.c:1599 netcp_setup_navigator_resources()
> 	warn: passing zero to 'PTR_ERR'
> 
> drivers/net/ethernet/ti/netcp_core.c
>   1583  static int netcp_setup_navigator_resources(struct net_device *ndev)
>   1584  {
>   1585          struct netcp_intf *netcp = netdev_priv(ndev);
>   1586          struct knav_queue_notify_config notify_cfg;
>   1587          struct knav_dma_cfg config;
>   1588          u32 last_fdq = 0;
>   1589          u8 name[16];
>   1590          int ret;
>   1591          int i;
>   1592  
>   1593          /* Create Rx/Tx descriptor pools */
>   1594          snprintf(name, sizeof(name), "rx-pool-%s", ndev->name);
>   1595          netcp->rx_pool = knav_pool_create(name, netcp->rx_pool_size,
>   1596                                                  netcp->rx_pool_region_id);
>   1597          if (IS_ERR_OR_NULL(netcp->rx_pool)) {
>   1598                  dev_err(netcp->ndev_dev, "Couldn't create rx pool\n");
>   1599                  ret = PTR_ERR(netcp->rx_pool);
>   1600                  goto fail;
>   1601          }
>   1602  
>   1603          snprintf(name, sizeof(name), "tx-pool-%s", ndev->name);
>   1604          netcp->tx_pool = knav_pool_create(name, netcp->tx_pool_size,
>   1605                                                  netcp->tx_pool_region_id);
>   1606          if (IS_ERR_OR_NULL(netcp->tx_pool)) {
>                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Assume this is NULL.
> 
> When a function returns a mix of error pointers and NULL that means the
> the feature can be disabled.  Like an error pointer is straight forward,
> it means that something is broken.  But a NULL just means the feature is
> disabled so it's not an error but we also don't have a pointer to the
> feature because it doesn't exist.
> 
> In this case, how can the driver function without memory pools?  It
> doesn't make sense that the user should be able to disable it.
> 
>   1607                  dev_err(netcp->ndev_dev, "Couldn't create tx pool\n");
> 
> If it's not an error, we shouldn't print an error message.
> 
>   1608                  ret = PTR_ERR(netcp->tx_pool);
> 
> PTR_ERR(NULL) is zero/success.
> 
>   1609                  goto fail;
>   1610          }
>   1611  
> 
> This driver mentions ERR_PTR_OR_NULL() a lot but all the mentions I saw
> were wrong.  :(  I can't compile the driver myself or I would send a
> patch.
> 
> regards,
> dan carpenter
