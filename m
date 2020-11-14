Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64CE22B2C76
	for <lists+kernel-janitors@lfdr.de>; Sat, 14 Nov 2020 10:47:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbgKNJr0 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 14 Nov 2020 04:47:26 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:37930 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbgKNJrZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 14 Nov 2020 04:47:25 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AE9UBhL100066;
        Sat, 14 Nov 2020 09:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=M0DSU4xL9ZMjcnoJdtVzr+y/mnzMYRXt41BMxzADVwI=;
 b=xLo7w10UzXAw6UAKQOG7o+0qsd+ZTdX2cKhf0VJORx3nn4ZeBG4loPWRPczJ3MFN07ZD
 JZIXOoh+qFhqSnoVZaebVKgkMVIWbgrfrF1FZgqQ1Sb5o/Jd8GQ3h/snaxFzzlqivLZq
 jEgDYukDm/qCLmg/oOZEUcqX7xkfbvVEJHCA+Pte0UECCPmKX2WXSxHGDEvcQlCpTzMO
 C0YCKltCSjiTtiQaOvRFG7emJM2xCusxW3reJAWNiy/meWVNN3yLpVSJ8wHJGG6S5wcN
 eIMGosowk6WCqvMWMWyQzGHCWxr1JEquVca+mcu+xPDsaOF42CJAibbC77hPPeBteffB Lg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 34t76kgewf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 14 Nov 2020 09:47:22 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AE9V5oO030536;
        Sat, 14 Nov 2020 09:45:22 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 34t71yt197-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 14 Nov 2020 09:45:22 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AE9jLRO006639;
        Sat, 14 Nov 2020 09:45:21 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 14 Nov 2020 01:45:21 -0800
Date:   Sat, 14 Nov 2020 12:45:16 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Paul Moore <paul@paul-moore.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] netlabel: fix our progress tracking in
 netlbl_unlabel_staticlist()
Message-ID: <20201114094516.GZ18329@kadam>
References: <20201113085255.GA91999@mwanda>
 <CAHC9VhQHas2FGcheAaizAHA65pfxa+oz5B88AP9WO4-hPF4kFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHC9VhQHas2FGcheAaizAHA65pfxa+oz5B88AP9WO4-hPF4kFg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9804 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011140060
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9804 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011140060
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Nov 13, 2020 at 09:41:01AM -0500, Paul Moore wrote:
> On Fri, Nov 13, 2020 at 3:53 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > Hello Paul Moore,
> >
> > The patch 866358ec331f: "netlabel: fix our progress tracking in
> > netlbl_unlabel_staticlist()" from Nov 8, 2020, leads to the following
> > static checker warning:
> >
> >         net/netlabel/netlabel_unlabeled.c:1190 netlbl_unlabel_staticlist()
> >         error: uninitialized symbol 'iter_chain'.
> 
> Thanks Dan, I'll look at it today.  I'm a little confused as to why
> the compiler didn't flag that, but perhaps I just missed it.  Anyway,
> patch later today ...

GCC has stopped warning about these for some reason.  Very frustrating.

regards,
dan carpenter
