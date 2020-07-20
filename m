Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89E26226029
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Jul 2020 14:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729004AbgGTMxT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 20 Jul 2020 08:53:19 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:48706 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729044AbgGTMxS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 20 Jul 2020 08:53:18 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06KClFwX191155;
        Mon, 20 Jul 2020 12:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=0zkku6O4txg39nxW3hH+nM0FxTBHkrAn+cnKVcErGjs=;
 b=EfEo3xov8LK+SszK2nbRIkPlxGA3nOph+J0qH/OZFDLF6ua12UUMYfKiIUYcI2NOL8iw
 rWtRjO7FRviR6b2rwqgcfiiTDwHjB96jAFd19ev0/PwpPAWwgZcOdkYJLwubJXUmPhec
 52I83/FBWWLV82+DsNQGYtX31nVgM+eGkMPTjQlrtmdt5KEH414hYE6wjz/wZcZ9dHVh
 ovvoS8cPcTTRUqAtiUsyaINhYU+oVbrWbEfXzBU6Yvpysr0IJHe4SDvw3HOpg/504Eny
 Ew2kIUzndiyheyUne1iVAwfDOV+qHQBjdHrxbimgOXNsYeehEtvD4BsGsu9E3r4h4UJp qw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 32bs1m6rp1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 20 Jul 2020 12:53:13 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06KClu6R151081;
        Mon, 20 Jul 2020 12:53:13 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 32d8kyrsg8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 20 Jul 2020 12:53:13 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06KCrCpO010581;
        Mon, 20 Jul 2020 12:53:12 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 20 Jul 2020 05:53:11 -0700
Date:   Mon, 20 Jul 2020 15:53:05 +0300
From:   <dan.carpenter@oracle.com>
To:     Vishal Kulkarni <vishal@chelsio.com>, divy@chelsio.com,
        kernel-janitors@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] Add support for the latest 1G/10G Chelsio adapter, T3.
Message-ID: <20200720125305.GA59894@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9687 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007200088
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9687 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 bulkscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 clxscore=1011
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007200088
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Vishal,

This is ancient code, but apparently you worked on it recently and no
good deed goes unpunished.  ;)

The patch 4d22de3e6cc4: "Add support for the latest 1G/10G Chelsio
adapter, T3." from Jan 18, 2007, leads to the following static
checker warning:

	drivers/net/ethernet/chelsio/cxgb3/sge.c:2086 rx_eth()
	error: buffer overflow 'adap->port' 2 <= 15 user_rl='0-15' uncapped

drivers/net/ethernet/chelsio/cxgb3/sge.c
  2078  static void rx_eth(struct adapter *adap, struct sge_rspq *rq,
  2079                     struct sk_buff *skb, int pad, int lro)
  2080  {
  2081          struct cpl_rx_pkt *p = (struct cpl_rx_pkt *)(skb->data + pad);
                                                             ^^^^^^^^^
Smatch distrusts skb->data.

  2082          struct sge_qset *qs = rspq_to_qset(rq);
  2083          struct port_info *pi;
  2084  
  2085          skb_pull(skb, sizeof(*p) + pad);
  2086          skb->protocol = eth_type_trans(skb, adap->port[p->iff]);
                                                               ^^^^^^
So it says that this can crash.  The ->port array only has two elements
and p->iff can go up to 16.  This seems like a valid bug.  I'm not
really sure how to address it..

  2087          pi = netdev_priv(skb->dev);
  2088          if ((skb->dev->features & NETIF_F_RXCSUM) && p->csum_valid &&
  2089              p->csum == htons(0xffff) && !p->fragment) {
  2090                  qs->port_stats[SGE_PSTAT_RX_CSUM_GOOD]++;
  2091                  skb->ip_summed = CHECKSUM_UNNECESSARY;
  2092          } else
  2093                  skb_checksum_none_assert(skb);
  2094          skb_record_rx_queue(skb, qs - &adap->sge.qs[pi->first_qset]);
  2095  
  2096          if (p->vlan_valid) {
  2097                  qs->port_stats[SGE_PSTAT_VLANEX]++;
  2098                  __vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), ntohs(p->vlan));
  2099          }
  2100          if (rq->polling) {
  2101                  if (lro)

regards,
dan carpenter
