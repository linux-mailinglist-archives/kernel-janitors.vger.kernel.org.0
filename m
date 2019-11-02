Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29672ECDEE
	for <lists+kernel-janitors@lfdr.de>; Sat,  2 Nov 2019 11:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbfKBKLc (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 2 Nov 2019 06:11:32 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:57618 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbfKBKLc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 2 Nov 2019 06:11:32 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA2AB8L6181525;
        Sat, 2 Nov 2019 10:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=AHQjNmu3TOneMRjsaecibWX7hufaeKsP6TS0tLOPwzY=;
 b=BFJd8h7QAf3cdrgFyt6WP6ATOwcCKjoCWxEAHU1DXdcVlqg91LW6LOy01egoR/nDgqqw
 gmwpoAsE5Bl6WfDa0xih6tTgeYTCz1ltWfdEclaZJDNE6VC9du75ifIYBRZ1WifWyA3i
 8AbXpV76mAdOBa44CZsRhOfSNAyVU7AVEhOxbWsBaL2jLMKfwcOgak4ZE5a6Uwmj8mTa
 bQ4QS3IsG4JfGOxWw5CYu7NAU3GMUofDPG4Z0duIgkr9he1PlLGF5bXGql/FiIWoJgvg
 YAgrT6GlLw5OSo/z98DrbSRBMBFWgrInHgBNJf8nmFdKDMaGIAKMLdvYdb4BDngDXoTA IA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 2w117th6wy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 02 Nov 2019 10:11:28 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA2A8xu3163871;
        Sat, 2 Nov 2019 10:11:27 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 2w0yucnrs2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 02 Nov 2019 10:11:27 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xA2ABPLo030771;
        Sat, 2 Nov 2019 10:11:26 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 02 Nov 2019 03:11:25 -0700
Date:   Sat, 2 Nov 2019 13:11:19 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     erwan.yvin@stericsson.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] caif_virtio: Introduce caif over virtio
Message-ID: <20191102101119.GA23109@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9428 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=466
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1911020099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9428 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=548 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1911020099
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Erwan Yvin,

This is a semi-automatic email about new static checker warnings.

The patch 0d2e1a2926b1: "caif_virtio: Introduce caif over virtio" 
from Mar 20, 2013, leads to the following Smatch complaint:

    drivers/net/caif/caif_virtio.c:190 cfv_release_used_buf()
    warn: variable dereferenced before check 'cfv->genpool' (see line 180)

drivers/net/caif/caif_virtio.c
   179	
   180			free_buf_info(cfv, buf_info);
                                      ^^^
Dereference inside the function.

   181	
   182			/* watermark_tx indicates if we previously stopped the tx
   183			 * queues. If we have enough free stots in the virtio ring,
   184			 * re-establish memory reserved and open up tx queues.
   185			 */
   186			if (cfv->vq_tx->num_free <= cfv->watermark_tx)
   187				continue;
   188	
   189			/* Re-establish memory reserve */
   190			if (cfv->reserved_mem == 0 && cfv->genpool)
                                                      ^^^^^^^^^^^^
Checked too late.

   191				cfv->reserved_mem =
   192					gen_pool_alloc(cfv->genpool,

regards,
dan carpenter
