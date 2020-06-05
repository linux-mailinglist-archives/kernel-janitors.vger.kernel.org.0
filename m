Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F6CB1EF84A
	for <lists+kernel-janitors@lfdr.de>; Fri,  5 Jun 2020 14:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbgFEMsX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 5 Jun 2020 08:48:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57662 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726879AbgFEMsX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 Jun 2020 08:48:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591361301;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eO1D3JEFx3gMyiYe03xD1d+mWzCgrlVM6JLDMuUPpwI=;
        b=HoHfI3/tB7+HeilpL1Jd+0KsMn5HCNh2ckp81PWMODwkEngcXQh5iuAmKiLQBfhhjZpVAE
        3hHfCYLfMbVeOMIlEvohEOKD8nolBvu2uQfYFZU+gXCRzo66IqIvKbIpDI8fL9WIvD5A9D
        AkuDjvQGANB4DjxzobJOhYCDzHjGjXg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-xA7feO_DO3ST7CeIocVSQQ-1; Fri, 05 Jun 2020 08:48:20 -0400
X-MC-Unique: xA7feO_DO3ST7CeIocVSQQ-1
Received: by mail-qt1-f199.google.com with SMTP id w14so8314463qtv.19
        for <kernel-janitors@vger.kernel.org>; Fri, 05 Jun 2020 05:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eO1D3JEFx3gMyiYe03xD1d+mWzCgrlVM6JLDMuUPpwI=;
        b=r7GT6WA3uzsSXwq0XGnfW1EV8VIylVaz2GKk8anFchbGw8UGa1jPglg+r+bIJyQD97
         ptwEZQP+nQ42fJH37lKW8P6Vcr89n78ZXb6ph20eRozs4Rg4W8pB01eIPgH8RumNmNY2
         gXnTe3jw39Mf0zQujaRiCTD/wmCnE+sBMfJK1w+yz5BbnpFaRfTJxUsBaVvrCxu0GNK3
         VKVETJfmuc+HFaMUE6USB0cQmk+xC+kcoZStMEnReXPGBpQP8eRGdk7BddywP60aWnIt
         O0f0TrFQN1nuZ9ZA3osb2SxPKZHB4XJhKWovfFiqGAPKW2Cno+KGZWMu1VQ0Lv+lzjR0
         5trg==
X-Gm-Message-State: AOAM530l3CyS5f+OkehGMfuYyaW4yi1aEGOBR7uiAGXBfQEm5RRODKOP
        ooLYwJcC0Ue7e3BKkSsQFy9wcGU2Eaab5/M63gn1cxI8hP6x4gfHCvgeg8TCcQRIplTc1dxglvs
        QZ3Ezlg4sB/qmUh8OURe5Lx5dKsXt
X-Received: by 2002:aed:21af:: with SMTP id l44mr10019742qtc.124.1591361299524;
        Fri, 05 Jun 2020 05:48:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKVSPnObIIx/lF3VrXTnCi0p2UjVU2aEXiipGyR5R5g+TcrRTsbvtNz/PEa3g8UQfd15ZLLQ==
X-Received: by 2002:aed:21af:: with SMTP id l44mr10019726qtc.124.1591361299260;
        Fri, 05 Jun 2020 05:48:19 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id j5sm7534542qtr.73.2020.06.05.05.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 05:48:18 -0700 (PDT)
Date:   Fri, 5 Jun 2020 08:48:16 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Andrew Jones <drjones@redhat.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Ben Gardon <bgardon@google.com>, Shuah Khan <shuah@kernel.org>,
        kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] KVM: selftests: delete some dead code
Message-ID: <20200605124816.GB55548@xz-x1>
References: <20200605110048.GB978434@mwanda>
 <9f20e25d-599d-c203-e3d4-905b122ef5a3@redhat.com>
 <20200605115316.z5tavmf5rjobypve@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200605115316.z5tavmf5rjobypve@kamzik.brq.redhat.com>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jun 05, 2020 at 01:53:16PM +0200, Andrew Jones wrote:
> On Fri, Jun 05, 2020 at 01:16:59PM +0200, Paolo Bonzini wrote:
> > On 05/06/20 13:00, Dan Carpenter wrote:
> > > The "uffd_delay" variable is unsigned so it's always going to be >= 0.
> > > 
> > > Fixes: 0119cb365c93 ("KVM: selftests: Add configurable demand paging delay")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > >  tools/testing/selftests/kvm/demand_paging_test.c | 2 --
> > >  1 file changed, 2 deletions(-)
> > > 
> > > diff --git a/tools/testing/selftests/kvm/demand_paging_test.c b/tools/testing/selftests/kvm/demand_paging_test.c
> > > index 360cd3ea4cd67..4eb79621434e6 100644
> > > --- a/tools/testing/selftests/kvm/demand_paging_test.c
> > > +++ b/tools/testing/selftests/kvm/demand_paging_test.c
> > > @@ -615,8 +615,6 @@ int main(int argc, char *argv[])
> > >  			break;
> > >  		case 'd':
> > >  			uffd_delay = strtoul(optarg, NULL, 0);
> > > -			TEST_ASSERT(uffd_delay >= 0,
> > > -				    "A negative UFFD delay is not supported.");
> > >  			break;
> > >  		case 'b':
> > >  			vcpu_memory_bytes = parse_size(optarg);
> > > 
> > 
> > The bug is that strtoul is "impossible" to use correctly.

Could I ask why?

> > The right fix
> > would be to have a replacement for strtoul.
> 
> The test needs an upper limit. It obviously doesn't make sense to ever
> want a ULONG_MAX usec delay. What's the maximum number of usecs we should
> allow?

Maybe this test can also be used to emulate a hang-forever kvm mmu fault due to
some reason we wanted, by specifying an extremely large value here?  From that
POV, seems still ok to even keep it unbound as a test...

Thanks,

-- 
Peter Xu

