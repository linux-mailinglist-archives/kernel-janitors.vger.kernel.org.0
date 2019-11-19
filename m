Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9512102556
	for <lists+kernel-janitors@lfdr.de>; Tue, 19 Nov 2019 14:25:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727665AbfKSNZr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 19 Nov 2019 08:25:47 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:53936 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726369AbfKSNZr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 Nov 2019 08:25:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574169945;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zuIFrepTI5XGjnmu7SZRBXm2ypngTSYro2lLoyi+D9U=;
        b=JLQtEiSI+NwnDBeKKHxGV7Dn6VNrdnoyJjvOcG08/jhiAad552Dw2oWGSfk9jyK1rZ09MD
        in5WpOznWffBqUBfz+Q6RFJClDxegOI4sIIcoDZRSUh/Sf+jIFJvUleQZkMjTHTJXqnyNK
        EL24j8nv+9mM1AY4CYwA00kiMTnj+Lg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-t6rx3LUZOMmZJ8HULZRaBg-1; Tue, 19 Nov 2019 08:25:44 -0500
Received: by mail-wr1-f71.google.com with SMTP id v6so18081304wrm.18
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Nov 2019 05:25:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=UWribs4bV+tz4KZQ/7HRXELXyhGEq0/rpuN5CPg+cLU=;
        b=chtXMmmWhwknOlOAFJ0M4qtPX5x/Lk5y39J0Qf1XfbAQrSQm68znZ2yV1rpYrIiSEk
         iYA3BY2O9XKRIQVXwyy2y6tDaBWfJ2exDlquQrUT/xll0oKJ7518EIxGXlRzGseoxC1K
         7nDr+0V5M5R3NULnosgj3eYXg18+3wuIxa8YkKwQ8YhUmbjMNl3Mrh9T1Ky+kH/RKcdq
         /Te5mdA7rj7+dNqyTZtyQJfk2ajN6MVkEnqymQtpVszF2z2Nmlps3q2Df/mUj8hDSEfD
         f60790z15gqK97zBcDC2mpT2xOiPEUOUgeJWQT1WZ0YYLiOR2mAds/QfuoUgvpOGflua
         L1FA==
X-Gm-Message-State: APjAAAUVfyo+e7PVBtgy8LQ2BPsDOWFtEZqtl6lpTGa1hkd3QYEyKwhb
        QcaoLwyNZnjwdcoRP3rxUILeiAGsFkdNZ/Ps8/m8TPyMAnWOsaNjB/Fv+zJV55pXn34m971jr7w
        9hqyQJKs56rBLjjimtcNPO7lzdfzt
X-Received: by 2002:a05:6000:14a:: with SMTP id r10mr26061339wrx.310.1574169942736;
        Tue, 19 Nov 2019 05:25:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqxyt0XLcdpHWEe/n4GPIDIIm1F1+q8ZirrEBw+e15nvX+SUzCfY2GLvuKgW2pCfMt5pAjJsTA==
X-Received: by 2002:a05:6000:14a:: with SMTP id r10mr26061309wrx.310.1574169942433;
        Tue, 19 Nov 2019 05:25:42 -0800 (PST)
Received: from vitty.brq.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id u13sm2968880wmm.45.2019.11.19.05.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 05:25:41 -0800 (PST)
From:   Vitaly Kuznetsov <vkuznets@redhat.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mao Wenan <maowenan@huawei.com>, pbonzini@redhat.com,
        rkrcmar@redhat.com, sean.j.christopherson@intel.com,
        wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] KVM: x86: remove set but not used variable 'called'
In-Reply-To: <20191119123956.GC5604@kadam>
References: <20191119030640.25097-1-maowenan@huawei.com> <87o8x8gjr5.fsf@vitty.brq.redhat.com> <20191119121423.GB5604@kadam> <87imnggidr.fsf@vitty.brq.redhat.com> <20191119123956.GC5604@kadam>
Date:   Tue, 19 Nov 2019 14:25:40 +0100
Message-ID: <87a78sgfqj.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
X-MC-Unique: t6rx3LUZOMmZJ8HULZRaBg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Tue, Nov 19, 2019 at 01:28:32PM +0100, Vitaly Kuznetsov wrote:
>> Dan Carpenter <dan.carpenter@oracle.com> writes:
>>=20
>> > On Tue, Nov 19, 2019 at 12:58:54PM +0100, Vitaly Kuznetsov wrote:
>> >> Mao Wenan <maowenan@huawei.com> writes:
>> >>=20
>> >> > Fixes gcc '-Wunused-but-set-variable' warning:
>> >> >
>> >> > arch/x86/kvm/x86.c: In function kvm_make_scan_ioapic_request_mask:
>> >> > arch/x86/kvm/x86.c:7911:7: warning: variable called set but not
>> >> > used [-Wunused-but-set-variable]
>> >> >
>> >> > It is not used since commit 7ee30bc132c6 ("KVM: x86: deliver KVM
>> >> > IOAPIC scan request to target vCPUs")
>> >>=20
>> >> Better expressed as=20
>> >>=20
>> >> Fixes: 7ee30bc132c6 ("KVM: x86: deliver KVM IOAPIC scan request to ta=
rget vCPUs")
>> >>=20
>> >
>> > There is sort of a debate about this whether the Fixes tag should be
>> > used if it's only a cleanup.
>> >
>>=20
>> I have to admit I'm involved in doing backporting sometimes and I really
>> appreciate Fixes: tags. Just so you know on which side of the debate I
>> am :-)
>
> But we're not going to backport this hopefully?
>

In case we're speaking about stable@ kernels, 7ee30bc132c6 doesn't look
like a good candidate (to me) but who knows, it may get pulled in
because of some code dependency or some other 'autosel magic'. And
that's when 'Fixes:' tags become handy.

--=20
Vitaly

