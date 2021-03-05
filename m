Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31AA632F51B
	for <lists+kernel-janitors@lfdr.de>; Fri,  5 Mar 2021 22:10:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbhCEVKC (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 5 Mar 2021 16:10:02 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:41086 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbhCEVJc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 Mar 2021 16:09:32 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 125IJEsi119068;
        Fri, 5 Mar 2021 18:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=1yb3IR7uMrDNVMX1fCrWykaocz129UynNSH37KKQI3A=;
 b=zpMTnBRto5B8/nSPt8FzzeKsDB2q9xw7n4BZFRjDMOBLOtyPC77hJT8BRPmPJ81jSoQO
 ecUoL4f15tFzco6mZ1h8R1vxdNlp3RvidXG3enesWbE29TQHcWJ+Wj2yxQzc/3pX85RH
 gCJz3jxn3YZs52py6WYk/Ji8cnNm7dxHdOXvryHJ1GGRXMBNaM3Kv3XNgZl5jXQdB6BP
 1VC7ELc8aYAodCVrvTec3JeLd+apsciQ2w/V0VVwzLfZnP5Z2+8dtaYDR2w6ciQTtjyt
 2bPF7A4km+2FmWr/47so/gsFUPlf7KisN99ggKChsYe2TlHh6L6aHF37+UboW9V1Up9y zg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 36ybkbkhj4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 05 Mar 2021 18:33:12 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 125ILF53138731;
        Fri, 5 Mar 2021 18:33:10 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 370004b3d4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 05 Mar 2021 18:33:10 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 125IX7o4016278;
        Fri, 5 Mar 2021 18:33:07 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 05 Mar 2021 18:33:07 +0000
Date:   Fri, 5 Mar 2021 21:32:59 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     devel@driverdev.osuosl.org, Ivan Safonov <insafonov@gmail.com>,
        Takashi Iwai <tiwai@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-janitors@vger.kernel.org,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: [PATCH] staging: rtl8188eu: prevent ->ssid overflow in
 rtw_wx_set_scan()
Message-ID: <20210305183259.GE2087@kadam>
References: <YEHymwsnHewzoam7@mwanda>
 <CAOc6etYqu_SJPjZtZdp4xDX=MVB0XY67tJ-EYoDYWuLfEyjnrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOc6etYqu_SJPjZtZdp4xDX=MVB0XY67tJ-EYoDYWuLfEyjnrw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9914 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103050094
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9914 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 impostorscore=0
 suspectscore=0 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 mlxlogscore=999 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103050094
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 05, 2021 at 10:58:17AM -0600, Edmundo Carmona Antoranz wrote:
> On Fri, Mar 5, 2021 at 2:59 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > -                                       if (sec_len > 0 && sec_len <= len) {
> > +                                       if (sec_len > 0 &&
> > +                                           sec_len <= len &&
> > +                                           sec_len <= 32) {
> 
> I wonder if this could be reduced to (sec_len > 0 && sec_len <=
> min(len, 32)) from a stylistic POV?

I kind of prefer it the way I wrote it.  I prefer conditions split
apart and done ploddingly, one at a time...  You'll notice how I could
have written it like:

					if (sec_len > 0 && sec_len <= len &&
					    sec_len <= 32) {

But I really like my conditions to be spelled out so the "sec_len" is
perfectly aligned in each part of the condition.  Your way would be to
combine two conditions into one part of a line and seems sneaky.

> 
> First attempt at something kernel related so I know there's plenty of
> things to learn (including patterns for problems like this and
> etiquette).

It's good that you're reviewing code...  We try to be predictable though
and no one would have predicted your response.  Ideally patch review
should be like, "Ugh!  Why didn't I think of that?  Of course, we should
propagate the error code."  Or "Oh, I didn't know checkpatch warns about
that."

The truth is that I don't always agree with all of Greg's reviews.  He
is more strict than I am about breaking up patches into multiple things.
(It's a tricky line to define for me).  But I can always predict what
Greg will say in a review so that saves time when I know which patches
he will accept and which he won't.

regards,
dan carpenter
