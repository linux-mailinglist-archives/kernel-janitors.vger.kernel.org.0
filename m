Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DEEE1EEB1D
	for <lists+kernel-janitors@lfdr.de>; Thu,  4 Jun 2020 21:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729214AbgFDT1R (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 4 Jun 2020 15:27:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41315 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728116AbgFDT1Q (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 4 Jun 2020 15:27:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591298833;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Q49Z4256vOBoq7DStqgcJEK9UupKdzcyujqiCc4dd9o=;
        b=FRDcHS9URDOTjooFuWKdeubu1+27tSZZUu1xCOh4wjBbHMND7FpVxQgfsfOWwnqKzr1qBi
        aapEY9pexnpcWWYVvuwx/HdwTpu0Vzix5UdggeEl58V93Bfxz0X8FJGMKnR+MS+wgJ/hZ8
        oxo2Qmplifwe0jtWyvd0x8K1hxV4sDk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-jvmt-XI0OCWXRzoX06F93Q-1; Thu, 04 Jun 2020 15:27:09 -0400
X-MC-Unique: jvmt-XI0OCWXRzoX06F93Q-1
Received: by mail-wr1-f69.google.com with SMTP id w4so2820517wrl.13
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Jun 2020 12:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q49Z4256vOBoq7DStqgcJEK9UupKdzcyujqiCc4dd9o=;
        b=OhXvYlhYG5CY5p1LzJreK98uV7qnScrBTtl/a3lE+WwDkAiqbeLtKUlVcpfic+cvf5
         2boqzBAR3mAPBdusZ3ZkkMLtDmPEZBqgLeVp5H3bKHrkq4fo31LSJzRfEReerChA1zAo
         U1d2B/MV5NAzg1UCvrovZuVcMbhnzpntJAIZr31fsE59lLuVq8z95RwHUt40qj3RqYEQ
         RClqipXt4DT0lG9dtC3+WLxye0eHTTkTT8Qj2Npr4DMR7D6Fax+izM/c3COLk4SW6+OX
         Fb/PPyPfr6M10BqsZivN/8h562sWZYammTyUmhgfv3fxOxO/Ti7Vm/HtoThGcZjBdH7O
         ZvQw==
X-Gm-Message-State: AOAM530I7voIMzGfWPwpEH7VjP4SKUEp8+m9dwMKTMWa6+B+51op720e
        pyhRxHZKtvPkOBJtf5KmQbhOlkqxr++k1navukMckRQIvd1q1BR/qG0nqgqzINJNjgQI5GtdS0f
        LnDqFX0EjshtjmUSjjz9EBvBv4rML
X-Received: by 2002:a05:600c:c3:: with SMTP id u3mr5149986wmm.108.1591298828086;
        Thu, 04 Jun 2020 12:27:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvcnPpK6VBqKCpJV3bB7l7vAoUXzeRhj0mnBk/bmYIFW6j4ZT+bUa1mlOaLtCHj4EUtktr1A==
X-Received: by 2002:a05:600c:c3:: with SMTP id u3mr5149966wmm.108.1591298827858;
        Thu, 04 Jun 2020 12:27:07 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
        by smtp.gmail.com with ESMTPSA id y37sm10879481wrd.55.2020.06.04.12.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 12:27:07 -0700 (PDT)
Date:   Thu, 4 Jun 2020 15:27:05 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Joe Perches <joe@perches.com>
Cc:     David Hildenbrand <david@redhat.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: MAINTAINERS: Wrong ordering in VIRTIO BALLOON
Message-ID: <20200604152654-mutt-send-email-mst@kernel.org>
References: <alpine.DEB.2.21.2005120717260.3701@felia>
 <bb2eea77-72df-6c53-5397-de057ffc9dd8@redhat.com>
 <80146d5713f8579a92b4da1e2b7d7626999dd9be.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80146d5713f8579a92b4da1e2b7d7626999dd9be.camel@perches.com>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, May 12, 2020 at 09:23:45AM -0700, Joe Perches wrote:
> On Tue, 2020-05-12 at 08:38 +0200, David Hildenbrand wrote:
> > On 12.05.20 07:21, Lukas Bulwahn wrote:
> > > Hi David,
> > > 
> > > with your commit 6d6b93b9afd8 ("MAINTAINERS: Add myself as virtio-balloon 
> > > co-maintainer"), visible on next-20200508, ./scripts/checkpatch.pl -f 
> > > MAINTAINERS complains:
> > > 
> > > WARNING: Misordered MAINTAINERS entry - list file patterns in alphabetic order
> > > #17982: FILE: MAINTAINERS:17982:
> > > +F:	include/uapi/linux/virtio_balloon.h
> > > +F:	include/linux/balloon_compaction.h
> > > 
> > > This is due to wrong ordering of the entries in your submission. If you 
> > > would like me to send you a patch fixing that, please just let me know.
> > > 
> > > It is a recent addition to checkpatch.pl to report ordering problems in 
> > > MAINTAINERS, so you might have not seen that at submission time.
> > 
> > Thanks for the notification Lukas,
> > 
> > b962ee8622d0 ("checkpatch: additional MAINTAINER section entry ordering
> > checks") is not in Linus' tree yet AFAIKS.
> > 
> > I can see that 3b50142d8528 ("MAINTAINERS: sort field names for all
> > entries") is upstream. I do wonder if we should just do another batch
> > update after the checkpatch patch is upstream instead, I guess more will
> > pile up?
> > 
> > @mst, joe, what do you prefer?
> > 
> > 1. I can resend the original patch.
> > 2. Lukas can send a fixup that we might want to squash.
> > 3. We wait until the checkpatch change goes upstream and to a final
> > batch update.
> 
> A fixup patch would work.
> 
> I think if Linus every once in awhile just before an -rc1 runs
> scripts/parse-maintainers like:
> 
> commit 3b50142d8528 ("MAINTAINERS: sort field names for all entries")
> 
> then these sorts of individual patches would not matter much.
> 
> This first time the script was run, I think there was just 1 patch
> conflict from -next to Linus' tree, and that scripted change was
> fairly large.
> 
> As the changes will generally be smaller in the future, it's unlikely
> there will be a significant number of conflicts.
> 


ok so just send a fixup patch pls.

