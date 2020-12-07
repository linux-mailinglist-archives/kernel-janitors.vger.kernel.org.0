Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A77302D1897
	for <lists+kernel-janitors@lfdr.de>; Mon,  7 Dec 2020 19:36:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725822AbgLGSf2 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 7 Dec 2020 13:35:28 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:56984 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgLGSf1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Dec 2020 13:35:27 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B7ITHnx036485;
        Mon, 7 Dec 2020 18:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=0T84XKxfw6bkdwzGfaci/aN/pmZ/9+1cQy5T+5bgdYo=;
 b=0ONs3cg6L4NrPss/lnoAnEqNg6Cal26fzZglU4UeqoEQqp356j44JFcTrfkiViSAjyRG
 yGjdci/XJg/bwziSgGg8eXDnyX8ghzFOAnmGpygu2pfd/8XhA3WCAfEsyzn2F5Fjv2P6
 kqnUAuBq7c7EmZpU33jhAXQw3jIQV7RdrW1CewSu97HlTfp7I530acQ/vvelLbJUm24n
 YAWmtkVWAEpmqAc7QkOzMVZ39ZqHKe8OXNKDmgt1MUDkEibzS/c3H5KdnKkokxSjlQeB
 /vOAQUQXxf5jCohzOZT/2PTFMvvYHHLSi9tMV4XqkZ/lHsgi0hYlSWebLdpRdtgbD3Tt wA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 357yqbq0qt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 07 Dec 2020 18:34:37 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B7ITfuL001667;
        Mon, 7 Dec 2020 18:34:36 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 358m4wn3em-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Dec 2020 18:34:36 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B7IYYYb018944;
        Mon, 7 Dec 2020 18:34:34 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 07 Dec 2020 10:34:34 -0800
Date:   Mon, 7 Dec 2020 21:34:26 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Arnd Bergmann <arnd.bergmann@linaro.org>,
        kbuild test robot <lkp@intel.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov02a10: fix an uninitialized return
Message-ID: <20201207183426.GY2767@kadam>
References: <X84nbdgv0a/ak2ef@mwanda>
 <20201207131446.GA852@paasikivi.fi.intel.com>
 <CAHp75Vftvtn4DhOU73w7hgOYpw9pJbJCJ0dSW6wUrQHA5HMn-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vftvtn4DhOU73w7hgOYpw9pJbJCJ0dSW6wUrQHA5HMn-A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9828 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012070119
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9828 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 clxscore=1011 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070119
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Dec 07, 2020 at 05:56:15PM +0200, Andy Shevchenko wrote:
> +Cc: some people who involved in different kernel source checkers
> 
> On Mon, Dec 7, 2020 at 3:19 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> > On Mon, Dec 07, 2020 at 04:00:29PM +0300, Dan Carpenter wrote:
> > > The "ret" variable isn't set on the no-op path where we are setting to
> > > on/off and it's in the on or off state already.
> > >
> > > Fixes: 91807efbe8ec ("media: i2c: add OV02A10 image sensor driver")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > Thanks for the patch.
> >
> > This issue has been fixed by another patch here:
> >
> > <URL:https://patchwork.linuxtv.org/project/linux-media/patch/20201204082037.1658297-1-arnd@kernel.org/>
> 
> This has been reported by 3 or 4 different people. I'm wondering if
> it's possible to introduce a common database to somehow reduce the
> amount of patches against the same findings.

Tell your devs to stop introducing bugs...  :P  This is your punishment.

Linus turned off GCC warnings for uninitialized variables earlier this
year.  He got annoyed because it doesn't work half the time depending on
the version and optimization level.  I sort of disagree with that,
because I reporting these bugs is taking up a lot of my time.  It has
definitely gotten worse from my perspective.

The best solution would be for the original developer to run Smatch on
their code.  Another option would be to make a script where you give it
a function name and it searches patches within the last week on
lore.kernel.org

regards,
dan carpenter
