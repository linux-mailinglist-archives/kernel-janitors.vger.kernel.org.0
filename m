Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E31A61745B
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 May 2019 10:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbfEHI6q (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 8 May 2019 04:58:46 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:37702 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbfEHI6p (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 May 2019 04:58:45 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x488t7fI125786;
        Wed, 8 May 2019 08:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=ZbtC6yxrJKtFmkHsz60DLF4OuODsmR7iM/zJQTa1o8c=;
 b=saFiBsdntlAdQwZLKECShMWMT3XWIUkL2aiO3L3BhnSc5DFgvY5yRK0DjQ6i67vf2kRs
 uBQI4HEtvfkDclzqp0EoEshT5m7DV8Uva/4XE7Idm19B+bduPSpgmR4GYLL7gyiNpsLL
 QlvgwolyfoFuUKwXg19dbF/FODC/QWtznYn8/7DpBS4ayJUW8n3PgYRNPtgufgbVhgKQ
 y3u5HRYTCPRyfdxRyFwuIGJnrZCeTpqYOSvMM4Orml2c127o2Di1tFxcxIpc1GPNiHKi
 ybIwUCX0Qq8GWS2I4gBfaqhHnF9JYE2xHSFHC0HVI7Me0oY+lwIhnNq+Y7DQGghL/Iw7 1g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 2s94b0tey8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 May 2019 08:58:08 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x488w8vD096402;
        Wed, 8 May 2019 08:58:08 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 2sagyue4th-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 May 2019 08:58:08 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x488w0L1010675;
        Wed, 8 May 2019 08:58:00 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 08 May 2019 01:58:00 -0700
Date:   Wed, 8 May 2019 11:57:52 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Jason Wessel <jason.wessel@windriver.com>,
        Douglas Anderson <dianders@chromium.org>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        kgdb-bugreport@lists.sourceforge.net,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] kdb: do a sanity check on the cpu in kdb_per_cpu()
Message-ID: <20190508085752.GY2239@kadam>
References: <20190506125018.GA13799@mwanda>
 <20190508084838.w7t3nwamobpmwgkv@holly.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190508084838.w7t3nwamobpmwgkv@holly.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9250 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905080058
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9250 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905080057
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, May 08, 2019 at 09:48:38AM +0100, Daniel Thompson wrote:
> On Mon, May 06, 2019 at 03:50:18PM +0300, Dan Carpenter wrote:
> > The "whichcpu" comes from argv[3].  The cpu_online() macro looks up the
> > cpu in a bitmap of online cpus, but if the value is too high then it
> > could read beyond the end of the bitmap and possibly Oops.
> > 
> > Fixes: 5d5314d6795f ("kdb: core for kgdb back end (1 of 2)")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Just out of interest... why isn't this copied to LKML? Omiting LKML makes
> the patch hard to find in a patchwork instance.

Sorry, I wasn't aware that anyone was using LKML for patchwork.

regards,
dan carpenter
