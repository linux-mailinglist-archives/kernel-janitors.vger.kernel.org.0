Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83EB72FFD66
	for <lists+kernel-janitors@lfdr.de>; Fri, 22 Jan 2021 08:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727139AbhAVH3j (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 22 Jan 2021 02:29:39 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:37884 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbhAVH33 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 22 Jan 2021 02:29:29 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10M7ONBH125200;
        Fri, 22 Jan 2021 07:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=mime-version :
 message-id : date : from : to : cc : subject : references : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=/DuSqlApP2zefpKFC3EaTQx4AI/PPRLO+Bixlpu+ERg=;
 b=C6+HBCtd5EHZKWarsQ8UeCOhREyYxj0CY4hR4fq0T8E1fHPltoccvkaJzp3/BW0Gat83
 2pog1phsBZEnGcEaQpAjvAAnlQmySnm9h6tHZlv63eiKalz25U1V2cLzvwSxFuRe1Bra
 cwyXUMs+nrV212rkw28STvQGSjc8qX0zJ7V+EVo/rREKGTGDXgiHgtLhPAlBnBmef565
 D7JUVpXkqAcwqDYvNAq7vCu8yCBPGbb6hZUh7VXUkBrsjSu0zubzfuXuiK5rs8mTV+Up
 np7xK5OtR/BJNwUdttoiUpKjz4Sx2sccFwEZJamJLbaNntHrKb/j5WT64gfNljxbM+eb Ug== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 3668qn2q7d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Jan 2021 07:27:55 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10M7Q520059779;
        Fri, 22 Jan 2021 07:27:54 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 3668rh3bdx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Jan 2021 07:27:54 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10M7Rofk022479;
        Fri, 22 Jan 2021 07:27:52 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 21 Jan 2021 23:27:33 -0800
USER-AGENT: Mutt/1.9.4 (2018-02-28)
MIME-Version: 1.0
Message-ID: <20210122072725.GJ20820@kadam>
Date:   Fri, 22 Jan 2021 07:27:25 +0000 (UTC)
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Clemens Ladisch <clemens@ladisch.de>
Cc:     Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: oxfw: fix info leak in hwdep_read()
References: <YAkassrrWUtsW6aZ@mwanda>
In-Reply-To: <YAkassrrWUtsW6aZ@mwanda>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9871 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220037
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9871 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220037
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Please ignore this one.  Christophe JAILLET pointed out that the info
leak isn't possible.  I'll send a clean up patch instead.

regards,
dan carpenter

