Return-Path: <kernel-janitors+bounces-2747-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A60618B0D11
	for <lists+kernel-janitors@lfdr.de>; Wed, 24 Apr 2024 16:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56F1528A902
	for <lists+kernel-janitors@lfdr.de>; Wed, 24 Apr 2024 14:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2000C15F40F;
	Wed, 24 Apr 2024 14:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gLHT0Dix"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFC615E5BE
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Apr 2024 14:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713970045; cv=none; b=ftLLkhCR98czljFNKcFJv2H8tZDa2TAR1u7naKvMOcXiGE/bg2Bv2UVcFMEo4FAIxllhSbCmnbL12trVQwKkqPoL6ghOPHkA6mhn8i1l/Cxg820gK5s8+j+/xgtZQ1UB1MzUccga9gaEzY1Qg8JjfdpLuZ3wKwc0ruq7YyxQJgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713970045; c=relaxed/simple;
	bh=jJfd4IpFSTzCj1thfurDYFV0ttjhLiG1qEH9ToU7uvk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NW2SJwwa4Ie9cPVRVy0vHsmwNYu02gVS3J8IjPyD+iVOrJ7LIOFaLld+D8K6aiw2WoXhDNZ46RIqXYnKPthnUEZ6u2O4bCHSyBvmL45frLZUgtu6j88Ybu7/+m/bnZvK9lslhEYA8+9UplZNjuhUOA5bWy6PUSfswk7ZWvFxCnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gLHT0Dix; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-61b2abd30f9so113517357b3.0
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Apr 2024 07:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713970042; x=1714574842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBUMF9M0aXotFfthPHhv12Yga6tlL0sQVtn3IgcNIjg=;
        b=gLHT0DixEIxV/L64q27Ss1sTGExF3Aum3m+EfcR2beLbl8Se9X1mGMXUryQayXTDFg
         RLMG2fWpsiR2VD11DDaq89AFocj4WUR/BSX6H0cxCS7JpzZc0SrHNGpZwfF9DbOxopJr
         t3oRxSCgD/tR2V4aZG55aTebrICmBqUaO+YFY4GKt36pcqOb7EIicstFYozXL8sYMru2
         1d1yO2+BsT/FeNGqAkbSiD9ohhAH8bJTX6TvBpeh23aqu4Yh7UCVe3UXvqb72dUqYp99
         f7r5aXvguNBRZ27ZW9Kbc2XNBaSMhJv8ZJRvTpfIdeIhcl+1N6w5xjUxbpPIC5iuE9hy
         PUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713970042; x=1714574842;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lBUMF9M0aXotFfthPHhv12Yga6tlL0sQVtn3IgcNIjg=;
        b=V/z81hdNdTVu5kkFjxu24/4icMrb6vro2FXidmLeIHKbnk5Uy5SLVMr+vSoNhQM14+
         Lzjem1c+AfpjRv7ZxYwb2vRJXIStrQiHwn6DeEbG38k5ZOOu5vooSpRbyvvyFNqhfvJ1
         sIq5Y3vFOCs6hxjLBNzpO67azpUBxuMqneQEVK6SGDv8RfNp6wCEMqXqyT0nG7GwqlVT
         vzeqmBAu+GaQX5yxqqEanzlEYaP0oh5MX/+EO/5dvbbqLelf0CbxUSyPo4azHBiicNQo
         Sxt6UR0DpuPX+6933vVYoDNi6+5PTCpQDCp6KDFPPZylB6RUkXvS+LOpg5LFiHDVgars
         AJJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXQNaX7A69W/X16lazkP15DKhItP63W6AfRg4UtClt2nYa/QHZavCJlGMAJzoVj0Jz7L56lPXh9VetpEazhP230jj/Ra466L5auPu48Q29
X-Gm-Message-State: AOJu0YwHFt6jKP99iokyJq3o9SfdUd45bX7wnDtOH1iWAsiEkSzQyzV7
	9KZXpobV1fV4A+2QnHC4sPcGmFSd5939InvFRJwMITvAd0LWaTxmF3RNaHxxuUYXIUCGwnX87JZ
	P0A==
X-Google-Smtp-Source: AGHT+IEs3VfA7KQdtkyHqJd0ahaIMhMEZs/CAyL0Jvui8r441EvbKI7ZhQcG9gTr1SgicGN29+v/lqbme1g=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1027:b0:de0:ecc6:4681 with SMTP id
 x7-20020a056902102700b00de0ecc64681mr234395ybt.1.1713970041911; Wed, 24 Apr
 2024 07:47:21 -0700 (PDT)
Date: Wed, 24 Apr 2024 07:47:20 -0700
In-Reply-To: <9f67df9d-ab27-40b9-8849-3069649dc082@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240423073952.2001989-1-chentao@kylinos.cn> <878bf83c-cd5b-48d0-8b4e-77223f1806dc@web.de>
 <ZifMAWn32tZBQHs0@google.com> <20240423-0db9024011213dcffe815c5c@orel>
 <ZigI48_cI7Twb9gD@google.com> <9f67df9d-ab27-40b9-8849-3069649dc082@moroto.mountain>
Message-ID: <ZikbeCsIom80tDPR@google.com>
Subject: Re: [PATCH] KVM: selftests: Add 'malloc' failure check in test_vmx_nested_state
From: Sean Christopherson <seanjc@google.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andrew Jones <ajones@ventanamicro.com>, Markus Elfring <Markus.Elfring@web.de>, 
	Kunwu Chan <chentao@kylinos.cn>, linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Kunwu Chan <kunwu.chan@hotmail.com>, Anup Patel <anup@brainfault.org>, 
	Thomas Huth <thuth@redhat.com>, Oliver Upton <oliver.upton@linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024, Dan Carpenter wrote:
> On Tue, Apr 23, 2024 at 12:15:47PM -0700, Sean Christopherson wrote:
> > On Tue, Apr 23, 2024, Andrew Jones wrote:
> > > On Tue, Apr 23, 2024 at 07:56:01AM -0700, Sean Christopherson wrote:
> > > > +others
> > > >=20
> > > > On Tue, Apr 23, 2024, Markus Elfring wrote:
> > > > > =E2=80=A6
> > > > > > This patch will add the malloc failure checking
> > > > > =E2=80=A6
> > > > >=20
> > > > > * Please use a corresponding imperative wording for the change de=
scription.
> > > > >=20
> > > > > * Would you like to add the tag =E2=80=9CFixes=E2=80=9D according=
ly?
> > > >=20
> > > > Nah, don't bother with Fixes.  OOM will cause the test to fail rega=
rdless, the
> > > > fact that it gets an assert instead a NULL pointer deref is nice to=
 have, but by
> > > > no means does it fix a bug.
> > > >=20
> > > > > > +++ b/tools/testing/selftests/kvm/x86_64/vmx_set_nested_state_t=
est.c
> > > > > > @@ -91,6 +91,7 @@ void test_vmx_nested_state(struct kvm_vcpu *v=
cpu)
> > > > > >  	const int state_sz =3D sizeof(struct kvm_nested_state) + getp=
agesize();
> > > > > >  	struct kvm_nested_state *state =3D
> > > > > >  		(struct kvm_nested_state *)malloc(state_sz);
> > > > > > +	TEST_ASSERT(state, "-ENOMEM when allocating kvm state");
> > > > > =E2=80=A6
> > > > >=20
> > > > > Can =E2=80=9Cerrno=E2=80=9D be relevant for the error message con=
struction?
> > > >=20
> > > > Probably not, but there's also no reason to assume ENOMEM.  TEST_AS=
SERT() spits
> > > > out the actual errno, and we can just say something like "malloc() =
failed for
> > > > blah blah blah". =20
> > > >=20
> > > > But rather than keeping playing whack-a-mole, what if we add macros=
 to perform
> > > > allocations and assert on the result?  I have zero interest in chas=
ing down all
> > > > of the "unsafe" allocations, and odds are very good that we'll coll=
ectively fail
> > > > to enforce checking on new code.
> > > >=20
> > > > E.g. something like (obviously won't compile, just for demonstratio=
n purposes)
> > > >=20
> > > > #define kvm_malloc(x)
> > > > ({
> > > > 	void *__ret;
> > > >=20
> > > > 	__ret  =3D malloc(x);
> > > > 	TEST_ASSERT(__ret, "Failed malloc(" #x ")\n");
> > > > 	__ret;
> > > > })
> > > >=20
> > > > #define kvm_calloc(x, y)
> > > > ({
> > > > 	void *__ret;
> > > >=20
> > > > 	__ret  =3D calloc(x, y);
> > > > 	TEST_ASSERT(__ret, "Failed calloc(" #x ", " #y ")\n");
> > > > 	__ret;
> > > > })
> > >=20
> > > Sounds good to me, but I'd call them test_malloc, test_calloc, etc. a=
nd
> > > put them in include/test_util.h
> >=20
> > Possibly terrible idea: what if we used kmalloc() and kcalloc()?  K is =
for KVM :-)
>=20
> That's a legit terrible idea...  It probably would trigger more static
> checker warnings because the general policy is kmalloc() is kernel code
> and we *have* to test for errors.

Roger that.

> To be honest, I would have just rejected the first patch.  You
> obviously know this and have said this earlier in the thread but just
> for the other people, this is a userspace test that runs for a short
> time and then exits.  If it gets killed because we don't have enough
> memory that's fine.  It would be better to just fix the static checker
> to not print pointless warnings or educate people to ignore warnings
> like this.

This particular patch may have been motiviated by a static checker, but I d=
oubt
static checkers are responsible for all of the many sanity checks on malloc=
() in
KVM selftests.  And while I agree that the sanity checks don't and much val=
ue,
deleting the existing checks and preventing checks from being reintroduced =
would
be a never ending battle.

> Creating the test_malloc() to silence the warning also seems like an
> okay idea as well.

Yeah, it's not exactly my first choice, but the reality is that people writ=
e KVM
elftests by copying an existing test (often literally), and so the best way=
 to
educate developers on the preferred approach/style is to have all existing =
code
adhere to a single approach/style.

