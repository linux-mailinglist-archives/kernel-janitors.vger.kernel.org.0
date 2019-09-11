Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32997AFF74
	for <lists+kernel-janitors@lfdr.de>; Wed, 11 Sep 2019 17:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727599AbfIKPDG (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 11 Sep 2019 11:03:06 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39879 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbfIKPDG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 11 Sep 2019 11:03:06 -0400
Received: by mail-pl1-f194.google.com with SMTP id bd8so10264565plb.6
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Sep 2019 08:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=d5/f69PU6WyAFI1qX9x9zilSuMPIBTYp7Aohz5P1zyE=;
        b=gG9oG4X6t6Mz6yTDo04xFkWf20EXHrv09t20/LH+aSTzrh2RTw+QSzwYppTHh/+iGr
         Xy3YKvNKV7lEtA8kVH00D0UqYTRP3q7UXUqGKtAqbp5+V+Ol5vglGzAkD6SdPRg6TEz8
         fAvO6N4Pz98rdBLVIlE63Pp79dtfoIMtgibcRylcAIO4eYNTWqxjWNwjzdmqYIue3w5H
         xXSQmYDJ3eRrJLWtftS6E2cn2mkOoNkJgam+8KNmTWWFY2RK+wekb8zPTnID9S69M3u9
         m9o8lhy3T9RKfd2gbUZ6R9z2h7AM8nABVyGJ/4AlWeGVG7pcjaxJgQ3YrEwRTy8f0gbj
         2Gvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=d5/f69PU6WyAFI1qX9x9zilSuMPIBTYp7Aohz5P1zyE=;
        b=H9WOUgpbbfyzW+WUguW7B9jateV3Dt6uqQdlRSx+OQf1J07/Y4dUkNP1gYiXIbP7PJ
         HL5AKecEh16k+0za28G5AtinyID2E0eCZt0RzE/lhfmlqhqAKY/wMzAKD5JBn+lYZXzC
         fqiDYGpE/59ngW/L/KCeyas7y1lCnAj4IfsJaAhkzDXKjIzSUTx73e9eDAe1uY73lv5J
         XvLYF59lNo1PDkt23ELvSauTnBEFHLoG3sd2oTHv/2ZlsVDAgDbM0AiCrgvhvBvAzIp9
         XKJ9C92Bv0sLVsHBJ/VQ0RrlYRYiz3b57QH8OBKI4HavHCmH516H8K5wbmTtUy0LJ5Of
         Xx/A==
X-Gm-Message-State: APjAAAXEjHvwNhEmv8EJ5xWhOfnCRPaynpXOGUv1ZZ/fxmQbT07i4FbC
        3d//So15q6mbfAzDEJbA/iI=
X-Google-Smtp-Source: APXvYqwAK3KLPcDsX3lbhfke/SAhZz2AVDZWn4jmFCZs0QExQGndexzB+79XY51SCLMPaunSN7zKbA==
X-Received: by 2002:a17:902:9d90:: with SMTP id c16mr26190254plq.12.1568214185878;
        Wed, 11 Sep 2019 08:03:05 -0700 (PDT)
Received: from SARKAR ([1.186.0.68])
        by smtp.gmail.com with ESMTPSA id v10sm2771364pjk.23.2019.09.11.08.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 08:03:05 -0700 (PDT)
Date:   Wed, 11 Sep 2019 20:33:00 +0530
From:   Rohit Sarkar <rohitsarkar5398@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Stefan Wahren <wahrenst@gmx.net>, devel@driverdev.osuosl.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-janitors@vger.kernel.org,
        Tobias =?iso-8859-1?Q?B=FCttner?= <tobias.buettner@fau.de>,
        Eric Anholt <eric@anholt.net>,
        linux-rpi-kernel@lists.infradead.org,
        Dominic Braun <inf.braun@fau.de>
Subject: Re: [PATCH] staging: vhciq_core: replace snprintf with scnprintf
Message-ID: <20190911150300.GA12027@SARKAR>
References: <20190911135112.GA5569@SARKAR>
 <7bf3c74d-e690-1ef1-dd74-ac98667e42ef@i2se.com>
 <20190911142543.GA9873@SARKAR>
 <20190911144312.GL15977@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190911144312.GL15977@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Sep 11, 2019 at 05:46:12PM +0300, Dan Carpenter wrote:
> On Wed, Sep 11, 2019 at 07:55:43PM +0530, Rohit Sarkar wrote:
> > On Wed, Sep 11, 2019 at 04:17:25PM +0200, Stefan Wahren wrote:
> > > Hi Rohit,
> > > 
> > > On 11.09.19 15:51, Rohit Sarkar wrote:
> > > > When the number of bytes to be printed exceeds the limit snprintf
> > > > returns the number of bytes that would have been printed (if there was
> > > > no truncation). This might cause issues, hence use scnprintf which
> > > > returns the actual number of bytes printed to buffer always
> > > >
> > > > Signed-off-by: Rohit Sarkar <rohitsarkar5398@gmail.com>
> > > thanks for your patch. Did you test your change on the Raspberry Pi?
> > 
> > Hey Stefan,
> > No I haven't done so as I thought this is a generic change?
> > Will that be necessary?
> 
> No.  It's not required.  The patch is easy to audit and clearly
> harmless.
> 
> The question would be does it actually fix a bug?  I looked at it and
> some of the strings are definitely a bit long.  The longest one I saw
> was:
> 	"  Slots: %d available (%d data), %d recyclable, %d stalls (%d data)",
> 	123456789 123456789 123456789 123456789 123456789 123456789 123456789
> 
> If you get a lot of stalls, then that looks like it could lead to a
> read overflow (an information leak).  Either way this does make the
> code a bit easier to audit so it seems like a nice cleanup.  Next time
> though, I really would prefer if you put this sort analysis in your
> commit message so I can just glance over it.  (I'm lazy).
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> regards,
> dan carpenter

Hey Dan,
Thanks for reviewing this :)
I will make sure to add some analysis the next time I do a clean up like
this.

There are a lot of usages of "snprintf" throughout the staging
directory (315 to be exact)
Would it be worthwhile to find ones that may cause an information leak
and replace them with "scnprintf"?
Thanks,
Rohit
