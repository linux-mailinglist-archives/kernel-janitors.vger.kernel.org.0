Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02C3C1EFF36
	for <lists+kernel-janitors@lfdr.de>; Fri,  5 Jun 2020 19:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727877AbgFERkK (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 5 Jun 2020 13:40:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20408 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727080AbgFERkK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 Jun 2020 13:40:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591378808;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/opGoEgIoDnDcLi9yZX38mmT0/AADXDWxmU4z3ixU+s=;
        b=O4qTlFkmNcbuI8DhkBundRv7i1G4Pao1MjwLAgWMynwknKIxW9iKZZELrFC3AuDk4SHIPw
        rAYF9n+zzL0mDsqriRqjTGn1Gvs6T34V0BE+9haM3eDEk8NgcA4D/O7XxQLc9h0S4UT2+f
        nLRFbMgVggNxwqKEtHYFi5hUHd2aBTw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-IDMs-q1ZOeuZSjNKpVGJZA-1; Fri, 05 Jun 2020 13:40:01 -0400
X-MC-Unique: IDMs-q1ZOeuZSjNKpVGJZA-1
Received: by mail-qt1-f199.google.com with SMTP id u26so9105864qtj.21
        for <kernel-janitors@vger.kernel.org>; Fri, 05 Jun 2020 10:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/opGoEgIoDnDcLi9yZX38mmT0/AADXDWxmU4z3ixU+s=;
        b=eWAFE/jDEnIfcTWEnT59Jg8X9NsBJzjsZC3U3X46UQXRG/ouqzwrg5M1uszTzglxC4
         koQp/cFOXMHqnewgzsY4iBKnUiYmTWaWt06R3txWnyavWUKwAXiJQEeH78+jx+nIIvda
         jubW/85mkA/EmlEJA9spP8+gw7SXC56ULzcyaWN9b/DVsEW3j1vcgYDJuorxGPAQllvt
         VenUQapwXBj7rDnP/s6mMApJnWrL2ceb4+HV+OxAX7iEWQU3ANBWiLQ9aplruUFyovOs
         uaFgxeeHr495wBDvXay+L7YOp6qhA4I3WnPEXNH/lGgfUJcmRIMmVv/ZG04UlbaFfmcC
         BXkg==
X-Gm-Message-State: AOAM533FVaTHTBymqLpTAOFjLN2wQjcEVG0Jkpprdf2MqfZJWeWStBj3
        MEqsVXYtGE5VgHY+/2DK4nxbhKQtA5+8YVYXyYXd1bQsL6R08uMqekFqWV/3B8ZdrJdMH4heyFa
        VN5r2nv1BTHla1/qYDoSh0vuuwBnc
X-Received: by 2002:a0c:b516:: with SMTP id d22mr11035122qve.88.1591378801303;
        Fri, 05 Jun 2020 10:40:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyR45UIs5BGkXfLlHRAVY1bsHugsmO0ud2/c7cAJHdU9j6xjM6xDnoawCzMXujmNEXw/5BqWQ==
X-Received: by 2002:a0c:b516:: with SMTP id d22mr11035076qve.88.1591378800779;
        Fri, 05 Jun 2020 10:40:00 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id d13sm328302qkc.121.2020.06.05.10.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 10:39:59 -0700 (PDT)
Date:   Fri, 5 Jun 2020 13:39:58 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Andrew Jones <drjones@redhat.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Ben Gardon <bgardon@google.com>, Shuah Khan <shuah@kernel.org>,
        kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] KVM: selftests: delete some dead code
Message-ID: <20200605173958.GC71522@xz-x1>
References: <20200605110048.GB978434@mwanda>
 <9f20e25d-599d-c203-e3d4-905b122ef5a3@redhat.com>
 <20200605115316.z5tavmf5rjobypve@kamzik.brq.redhat.com>
 <20200605124816.GB55548@xz-x1>
 <891e89c8-8467-eeb4-1b23-337b88a299dd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <891e89c8-8467-eeb4-1b23-337b88a299dd@redhat.com>
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jun 05, 2020 at 03:26:39PM +0200, Paolo Bonzini wrote:
> On 05/06/20 14:48, Peter Xu wrote:
> >>> The bug is that strtoul is "impossible" to use correctly.
> > Could I ask why?
> 
> To see see how annoying the situation is, check out utils/cutils.c in
> QEMU; basically, it is very hard to do error handling.  From the man page:
> 
>        Since  strtoul() can legitimately return 0 or ULONG_MAX
>        (ULLONG_MAX for strtoull()) on both success and failure, the
>        calling program should set errno to 0 before the call, and then
>        determine if an error occurred by checking whether errno has
>        a nonzero value after the call.
> 
> and of course no one wants to write code for that every time they have
> to parse a number.
> 
> In addition, if the string is empty it returns 0, and of endptr is NULL
> it will accept something like "123abc" and return 123.
> 
> So it is not literally impossible, but it is a poorly-designed interface
> which is a major source of bugs.  On Rusty's API design levels[1][2], I
> would put it at 3 if I'm feeling generous ("Read the documentation and
> you'll get it right"), and at -4 to -7 ("The obvious use is wrong") if
> it's been a bad day.
> 
> Therefore it's quite common to have a wrapper like
> 
>     int my_strtoul(char *p, char **endptr, unsigned long *result);
> 
> The wrapper will:
> 
> - check that the string is not empty
> 
> - always return 0 or -1 because of the by-reference output argument "result"
> 
> - take care of checking that the entire input string was parsed, for
> example by rejecting partial parsing of the string if endptr == NULL.
> 
> This version gets a solid 7 ("The obvious use is probably the correct
> one"); possibly even 8 ("The compiler will warn if you get it wrong")
> because the output argument gives you better protection against overflow.
> 
> Regarding overflow, there is a strtol but not a strtoi, so you need to
> have a temporary long and do range checking manually.  Again, you will
> most likely make mistakes if you use strtol, while my_strtol will merely
> make it annoying but it should be obvious that you're getting it wrong.
> 
> Paolo
> 
> [1] https://ozlabs.org/~rusty/index.cgi/tech/2008-03-30.html
> [2] https://ozlabs.org/~rusty/index.cgi/tech/2008-04-01.html

Fair enough, and a good reading material. :)

Thanks!

-- 
Peter Xu

