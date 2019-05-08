Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C29617277
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 May 2019 09:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbfEHHUA (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 8 May 2019 03:20:00 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:59348 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbfEHHUA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 May 2019 03:20:00 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x487EJOL033701;
        Wed, 8 May 2019 07:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=VnMqdRiriuwaYbcTATbbAxOl/0dHyVxrWMS/lk29xnY=;
 b=4DkRSk+uOmK2VHoiAv2wJYs07d1nuJK1rZ2xE6eMGvZu5piY/pEr8LqZJDNWLSb3ENJd
 3kgIR2JY0J3rXBdWYo1JiglqFuFXjauMwJ9+a5K7jwExDOM+ZcLYlPmyJ0nsu9qW2g0m
 h6MyrM+DE9qTdW34NVflBXOXmTWGJfSxHGYH5/OCRZ5YaaZZzEyZXBot2ETQ1BK8bSNe
 x6q11Of0nOn9ANQ/m4n+BpCUX6mFBzyPIl2fUcH/97oPvh7kf2vEPM59nk2OCdf3up6y
 OMGMdc6coe9fTUQyujwaQK6eTljVmuxwlru2qfKUyMqvd7z3Pin5/b2JXJv1TyQY+xq9 xg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 2s94b61xvg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 May 2019 07:19:57 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x487J1Vv056422;
        Wed, 8 May 2019 07:19:57 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 2s94b9x41s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 May 2019 07:19:57 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x487Jvbu013042;
        Wed, 8 May 2019 07:19:57 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 08 May 2019 00:19:56 -0700
Date:   Wed, 8 May 2019 10:19:51 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     olteanv@gmail.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: dsa: sja1105: Add support for Spanning Tree
 Protocol
Message-ID: <20190508071951.GA12293@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9250 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905080047
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9250 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905080047
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Vladimir Oltean,

The patch 640f763f98c2: "net: dsa: sja1105: Add support for Spanning
Tree Protocol" from May 5, 2019, leads to the following static
checker warning:

	drivers/net/dsa/sja1105/sja1105_main.c:1073 sja1105_stp_state_get()
	warn: signedness bug returning '(-22)'

drivers/net/dsa/sja1105/sja1105_main.c
  1059  static u8 sja1105_stp_state_get(struct sja1105_private *priv, int port)
               ^^
  1060  {
  1061          struct sja1105_mac_config_entry *mac;
  1062  
  1063          mac = priv->static_config.tables[BLK_IDX_MAC_CONFIG].entries;
  1064  
  1065          if (!mac[port].ingress && !mac[port].egress && !mac[port].dyn_learn)
  1066                  return BR_STATE_BLOCKING;
  1067          if (mac[port].ingress && !mac[port].egress && !mac[port].dyn_learn)
  1068                  return BR_STATE_LISTENING;
  1069          if (mac[port].ingress && !mac[port].egress && mac[port].dyn_learn)
  1070                  return BR_STATE_LEARNING;
  1071          if (mac[port].ingress && mac[port].egress && mac[port].dyn_learn)
  1072                  return BR_STATE_FORWARDING;
  1073          return -EINVAL;
                ^^^^^^^^^^^^^^
The caller doesn't check for negative errors anyway.

  1074  }

regards,
dan carpenter
