Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2363D7A6ADA
	for <lists+kernel-janitors@lfdr.de>; Tue, 19 Sep 2023 20:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232223AbjISSrT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 19 Sep 2023 14:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232084AbjISSrR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 Sep 2023 14:47:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BCA49D
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Sep 2023 11:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695149185;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TzpUibuueoiUi5QQWcPcHUVW4AL0fimUeWUbG94nOMk=;
        b=CFPdPAluWjsXOBsHuq57Xsb+K7moW0WlU7a1rmjJEfBUe4xa6hSq8jFV7QsOXrCKRfL8Q4
        4jUISbR9RBo/Hy98bJMoe+HbI7Oql7imQdtqBmglsiAZsRkQjNWrDCfTaxT0HrjJ6XKYLS
        1ZebrgSxB2Ic6WJAgDMS/V0czTZ2acQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-437xpNx0MlOf8_JHfN0dig-1; Tue, 19 Sep 2023 14:46:24 -0400
X-MC-Unique: 437xpNx0MlOf8_JHfN0dig-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6561b118866so65882726d6.0
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Sep 2023 11:46:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695149183; x=1695753983;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TzpUibuueoiUi5QQWcPcHUVW4AL0fimUeWUbG94nOMk=;
        b=cn3EnFa40KwacTCgIIWQCjW1ufZ2PtXZr5piWDvOGnP9wzRGlr7T6xX+2CKgPZ0X09
         ykqjL8h0XPAp1ShouFAgrJsJDQL2SSt9ePP7oqcQQP3Kx59ctHYSEGMelIjRzZbXIYn9
         uaYcXIS4YMC6Mz3tAtWsk3DY3B8auOb3EfiPE3Nqv8xO90sFpfT4YvxSPBuwuQHOc0In
         E+OjZOhsC12oN0cvdC5eM7LK6UL9CRtvPOfQPkDqlt2HGu2Ih1Zq+QLLG/85ZzUymYwV
         PidIE1wO6KR0jUtAIWbnotjI7F8SCl/EShk5Ln5fEbVahg7ydpcoIgVR4pptchiks9pI
         YSVA==
X-Gm-Message-State: AOJu0Ywj7WS3flm7KPE4hldvbo1h9eS231x33cv6hmEALur8EM88W/AR
        gWaAPuGBzibwQ8xhOwKGPywFd1lTYuBXwMKpXrg/Eunnfgf9DiVkp/B0kMALqkEItsCnK1BMwrA
        lAn8DGBT9GPhYomugBLEcjORWPlJm
X-Received: by 2002:a0c:f394:0:b0:655:c204:9307 with SMTP id i20-20020a0cf394000000b00655c2049307mr256853qvk.38.1695149183440;
        Tue, 19 Sep 2023 11:46:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEi0um2A+yZHNy+40yE80Y6Ufc0+PSoBWGaAEKvPr4k7X1+IkZBcYv08eShWHHQg4gYPls3w==
X-Received: by 2002:a0c:f394:0:b0:655:c204:9307 with SMTP id i20-20020a0cf394000000b00655c2049307mr256842qvk.38.1695149183227;
        Tue, 19 Sep 2023 11:46:23 -0700 (PDT)
Received: from bfoster (c-24-60-61-41.hsd1.ma.comcast.net. [24.60.61.41])
        by smtp.gmail.com with ESMTPSA id h20-20020a0cf414000000b0065647f59c4esm3024931qvl.51.2023.09.19.11.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 11:46:22 -0700 (PDT)
Date:   Tue, 19 Sep 2023 14:46:36 -0400
From:   Brian Foster <bfoster@redhat.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Kent Overstreet <kent.overstreet@linux.dev>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-bcachefs@vger.kernel.org
Subject: Re: [PATCH] bcachefs: Avoid a potential memory over-allocation in
 bch2_printbuf_make_room()
Message-ID: <ZQnsjHlCdk5adChF@bfoster>
References: <2e6a82a83d0ddd9ce7f36ea889dd7ffc30f5fbc9.1694853900.git.christophe.jaillet@wanadoo.fr>
 <ZQmfpzxX+qjLtJjm@bfoster>
 <2931c006-d987-2261-1c39-5c41a4b17f75@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2931c006-d987-2261-1c39-5c41a4b17f75@wanadoo.fr>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Sep 19, 2023 at 08:34:00PM +0200, Christophe JAILLET wrote:
> Le 19/09/2023 � 15:18, Brian Foster a �crit�:
> > On Sat, Sep 16, 2023 at 10:45:23AM +0200, Christophe JAILLET wrote:
> > > kmalloc() and co. don't always allocate a power of 2 number of bytes.
> > > There are some special handling for 64<n<=96 and 128<n<=192 cases.
> > > 
> > 
> > It's not immediately clear to me what you mean by "special handling."
> > Taking a quick look at slabinfo, it looks like what you mean is that
> > slab rounding is a bit more granular than power of two, particularly in
> > these ranges. Is that right? If so, JFYI it would be helpful to describe
> > that more explicitly in the commit log.
> 
> That's what I tried to do with my 2 phrases.
> Sound good and clear to the French speaking man I am :)
> 
> Would you mind updating the phrasing yourself?
> A trial and error method about wording with a non native English speaking
> person can be somewhat a long and boring experience to me.
> 
> All what I could propose, with the help of google translate, is:
> 
> "
> kmalloc() does not necessarily allocate a number of bytes equal to a power
> of two. There are special cases for sizes between 65 and 96 and between 129
> and 192. In these cases, 96 and 192 bytes are allocated respectively.
> 
> So, instead of forcing an allocation always equal to a power of two, it may
> be interesting to use the same rounding rules as kmalloc(). This helps avoid
> over-allocating some memory.
> 
> Use kmalloc_size_roundup() instead of roundup_pow_of_two().
> "
> 
> If this is fine to you I can send a v2 with this wording, otherwise, either
> tweak it to what sounds good to you, or just ignore this patch.
> 

I think that wording is fine. I don't think it's necessary to send a v2
just for a commit log update, but feel free to do so if you want.
Ultimately it will be up to Kent if he's alright with the change.

Brian

> CJ
> 
> > 
> > > So trust kmalloc() algorithm instead of forcing a power of 2 allocation.
> > > This can saves a few bytes of memory and still make use of all the
> > > memory allocated.
> > > 
> > > On the other side, it may require an additional realloc() in some cases.
> > > 
> > 
> > Well, I feel like this isn't the only place I've seen the power of two
> > buffer size realloc algorithm thing, but in thinking about it this seems
> > fairly harmless and reasonable for printbufs. FWIW:
> > 
> > Reviewed-by: Brian Foster <bfoster@redhat.com>
> > 
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > ---
> > >   fs/bcachefs/printbuf.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/fs/bcachefs/printbuf.c b/fs/bcachefs/printbuf.c
> > > index 77bee9060bfe..34527407e950 100644
> > > --- a/fs/bcachefs/printbuf.c
> > > +++ b/fs/bcachefs/printbuf.c
> > > @@ -28,7 +28,7 @@ int bch2_printbuf_make_room(struct printbuf *out, unsigned extra)
> > >   	if (out->pos + extra < out->size)
> > >   		return 0;
> > > -	new_size = roundup_pow_of_two(out->size + extra);
> > > +	new_size = kmalloc_size_roundup(out->size + extra);
> > >   	/*
> > >   	 * Note: output buffer must be freeable with kfree(), it's not required
> > > -- 
> > > 2.34.1
> > > 
> > 
> > 
> 

