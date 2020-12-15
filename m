Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B05E02DAEA3
	for <lists+kernel-janitors@lfdr.de>; Tue, 15 Dec 2020 15:12:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729041AbgLOOJ0 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 15 Dec 2020 09:09:26 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:46974 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728949AbgLOOJJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Dec 2020 09:09:09 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BFE41Oh077879;
        Tue, 15 Dec 2020 14:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=EyxgZpAWKqpYDKBVeZinWMMmVuUsX1GxOQaW0w+M3lk=;
 b=p0fgYpSCP+5b5C7lhpS3xIBiMReJbMIxdrNlquoZWRYJnqVdI4B2Fr/D+dv37kGuS0nQ
 xETXN86kyV44a6BSbDyc/qigmFyD9r/NFJdN/e09h6vqDXAGg2VF5bcQJbD3kcCmoOed
 Hj7grgNiEOsTlor4OjLt5fCMsiXt87iPES2Yohds60mAHqr9JaGlC9/cHXYt6BVMNvR7
 S1M3HKCDRpo4wM4zxep7kcQyUD4Ifqixt2iv6XrAUzC0r/YYfQamLKIT77Mm8RxelblS
 IrhtfbZ9q2ch8YXsUPUNAforjbtEoUkVe7/jTQAVs7aXQl8AsV8L2HIYNOS3x++6d3/N 8g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 35cntm2mxh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 15 Dec 2020 14:08:15 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BFE69ij110137;
        Tue, 15 Dec 2020 14:06:14 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 35d7sw86bj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 15 Dec 2020 14:06:14 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BFE6DOD016863;
        Tue, 15 Dec 2020 14:06:13 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 15 Dec 2020 06:06:13 -0800
Date:   Tue, 15 Dec 2020 17:06:06 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     john.garry@huawei.com
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        kernel-janitors@vger.kernel.org
Subject: [bug report] driver core: platform: Add
 devm_platform_get_irqs_affinity()
Message-ID: <X9jCzrzqfyEHIi26@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9835 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012150101
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9835 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012150101
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello John Garry,

The patch e15f2fa959f2: "driver core: platform: Add
devm_platform_get_irqs_affinity()" from Dec 2, 2020, leads to the
following static checker warning:

	drivers/base/platform.c:370 devm_platform_get_irqs_affinity()
	warn: 'nvec' possible negative type promoted to high

drivers/base/platform.c
   351  int devm_platform_get_irqs_affinity(struct platform_device *dev,
   352                                      struct irq_affinity *affd,
   353                                      unsigned int minvec,
   354                                      unsigned int maxvec,
   355                                      int **irqs)
   356  {
   357          struct irq_affinity_devres *ptr;
   358          struct irq_affinity_desc *desc;
   359          size_t size;
   360          int i, ret, nvec;
   361  
   362          if (!affd)
   363                  return -EPERM;
   364  
   365          if (maxvec < minvec)
   366                  return -ERANGE;
   367  
   368          nvec = platform_irq_count(dev);
   369  
   370          if (nvec < minvec)
                    ^^^^
If "nvec" is -EPROBE_DEFER then "minvec" is an unsigned int so it gets
type promoted to a very high positive so it's > minvec.

   371                  return -ENOSPC;
   372  
   373          nvec = irq_calc_affinity_vectors(minvec, nvec, affd);
   374          if (nvec < minvec)
   375                  return -ENOSPC;
   376  
   377          if (nvec > maxvec)
   378                  nvec = maxvec;
   379  
   380          size = sizeof(*ptr) + sizeof(unsigned int) * nvec;

regards,
dan carpenter
