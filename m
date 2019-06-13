Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1917A44505
	for <lists+kernel-janitors@lfdr.de>; Thu, 13 Jun 2019 18:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730753AbfFMQlT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 13 Jun 2019 12:41:19 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:44006 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730558AbfFMGzS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 13 Jun 2019 02:55:18 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5D6sJG4020287;
        Thu, 13 Jun 2019 06:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=h0NT7xGLynQwL19g7wAKeNt23KGjzTYzLVjM6PNxors=;
 b=gdMpfq+IeZhHkl0YuA8Hz3rlm85QqRBVF2kmtZMZdj1PdLRvUds+juRqo2FyEPXUQWBy
 f2p5rS6EKw5kktqYnRrIiu6aERGIVSo1s/k7kzM/L1ujFAE6zT+v1G+h8woTHgFPEnNl
 j2D742dVRwjMi4XbCCCva5LZKpwnLqV6tv6vJH5K6v5EV2ZL4kanz/LzIpUZ6JJ1q78P
 s37wyIyYfkIaoDmIOSp/LDN7RyYpLdOoLHOFV/8OaXAlyOZ4vRNR2/tSfohYry/3TG84
 hnCCSK+mA4Wo9yRM3+iTMSuPwtfg3B7opVOwoEikzzZJAuJXlnCStbcieLjE6ZrQOAX5 zg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2t05nqyhgh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 13 Jun 2019 06:55:14 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5D6sx8w078574;
        Thu, 13 Jun 2019 06:55:14 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 2t1jpjd06u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 13 Jun 2019 06:55:14 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5D6tCRr026731;
        Thu, 13 Jun 2019 06:55:12 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 12 Jun 2019 23:55:11 -0700
Date:   Thu, 13 Jun 2019 09:55:05 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     suzuki.poulose@arm.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] coresight: tmc: Clean up device specific data
Message-ID: <20190613065505.GC16334@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9286 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=562
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906130055
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9286 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=614 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906130055
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Suzuki K Poulose,

This is a semi-automatic email about new static checker warnings.

The patch 743256e214e8: "coresight: tmc: Clean up device specific 
data" from May 22, 2019, leads to the following Smatch complaint:

    drivers/hwtracing/coresight/coresight-tmc-etr.c:625 tmc_etr_free_flat_buf()
    warn: variable dereferenced before check 'flat_buf' (see line 623)

drivers/hwtracing/coresight/coresight-tmc-etr.c
   622		struct etr_flat_buf *flat_buf = etr_buf->private;
   623		struct device *real_dev = flat_buf->dev->parent;
                                          ^^^^^^^^^^
The patch introduces a new NULL check

   624	
   625		if (flat_buf && flat_buf->daddr)
                    ^^^^^^^^
but the existing code assumed it can be NULL.

   626			dma_free_coherent(real_dev, flat_buf->size,
   627					  flat_buf->vaddr, flat_buf->daddr);

regards,
dan carpenter
