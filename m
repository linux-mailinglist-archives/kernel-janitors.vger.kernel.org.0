Return-Path: <kernel-janitors+bounces-1883-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16015862C60
	for <lists+kernel-janitors@lfdr.de>; Sun, 25 Feb 2024 18:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB7621F21DE2
	for <lists+kernel-janitors@lfdr.de>; Sun, 25 Feb 2024 17:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C8718637;
	Sun, 25 Feb 2024 17:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G5XL5yM7"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747991862F
	for <kernel-janitors@vger.kernel.org>; Sun, 25 Feb 2024 17:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708883061; cv=none; b=Q78bRlq+LRFB3RFMoBpnHur8mXIiEK/f84xGvWs2hXhLEWniaFl1lXErBOdADMiO2e1HRohjMtLlg0Drhil39UtKg63e1Ex3YkeOi4iQfJKCfaDHAuT8JJPVEJ+95qy0kN7OWqNmA+gZndUCLQmZLhTSXsiy3cH28UVt7prduCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708883061; c=relaxed/simple;
	bh=0K5xMPOYequh7ZQp99U8co9tYPwwBbzQ3CMMu8+kdV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WKGYWFv8IcJJQis5InnWrZgr8SsZJsRQtnvV5K8gg7OTs/j1RfyOHCkdl/OHPI+W5eNC/Ex5sIepErIrGq1+WJHR1hRZxMqtRLGKeWLYpyDDZkkxbVyaTQzOZ5dru/qkVRxseyHY6Beeas5+CHxZl4XeHpGXkkGx2xXvfikfYsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G5XL5yM7; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1dbe7e51f91so117815ad.1
        for <kernel-janitors@vger.kernel.org>; Sun, 25 Feb 2024 09:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708883059; x=1709487859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qStKuBILkLY1v8oXdUPbeQuvbfRqjxTb+0Ot/9pOfvc=;
        b=G5XL5yM7BYQJjCRV4A55ICRhscaOFic+8Pl8beXvWXYMYDO0RPNbPgkjGzAlG0Ibmt
         7nyO8TPMmCleAq5npznvW1itZN+6uGMCyCVKKujzoH2sakS/VLFGWcz6MunlXyT2UM+S
         SwKQIhbcD6acX6wilUEf25pUT+Ufodj+h/uO+TSug5bntZuxtdJBmC/2HLax04qZbGGe
         e2fPo98aQ+ZEEUN2fLnrF4fP+EC+15H8KwzNh0bldSphcNInWvegc10Jzp17wqK2Tevn
         HOrqo1QyfeV1KHKmlitynT47ssJ+BBRjEfisvuM5u3S79+IrvrSLMCrKdlDWoyOfvmKH
         +mNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708883059; x=1709487859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qStKuBILkLY1v8oXdUPbeQuvbfRqjxTb+0Ot/9pOfvc=;
        b=xM4hC7CuulG806RErTxS7pbXFy+C3KkU3eunD/klvGTVuTuQPE2eLhsxnU/TSGjTfv
         eUVpCZO2DKm/2L4ajWkixQVXU5qzZoWvl6WR8gMJjq9Y3lGY8v17F4o9JhcLgncE0zIJ
         Vp321lh/2jdhn+RBjMFJj0n7mmPAJUUWsbZ0mptTcCJ7qC39P2SXQKbOt80j8tUih06h
         JQUUjtT7KV3bbk/qKv3IIXV3z8t9646lPHOwhvztHF773jqraNc7GjMe8qN6c0z+Oqf7
         S4RBq5kMILqP+TXiOLKjbKTyWCi9/XAz2JRn7itGVGxgLlU0b/DkDWEU3kpIThIXIqC3
         y3qw==
X-Forwarded-Encrypted: i=1; AJvYcCWoA1z3X1N4IBNuCaIlg3p6AsSfmN030CTd8/Dbf0q1SqjsjLEcIgm0NzyZQa3Q4qqIpLJBcByPbJVJN2xaV29aMvvVUcy3tw5SnCk+5vre
X-Gm-Message-State: AOJu0YxLC0AN4pmzxdFZUSrlQGhourxT+viGI/7/v5qdpMMMgkfkeRHu
	wDX/F6LJ2tLfGSN5nH2pAeSWsHlRs/bDLpc7uleDedns/OC29HRx+jSI8eQt8uVy6x0v9SDZsa4
	9Kc7GjrKTmtsBW5gLTm11kaTkWcwkJJ2TcWcM
X-Google-Smtp-Source: AGHT+IErOGEY0ni+ULakJAaE+x5eBVu1gsfbzxfzy3KLUCvMo87Nc+2OWz/bDWgTxXZssUbPaDS0WS4CaFvvsNOJJik=
X-Received: by 2002:a17:902:fc4c:b0:1db:971b:cb62 with SMTP id
 me12-20020a170902fc4c00b001db971bcb62mr239463plb.8.1708883058352; Sun, 25 Feb
 2024 09:44:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9538b2b634894c33168dfe9d848d4df31fd4d801.1693085544.git.christophe.jaillet@wanadoo.fr>
 <3e1ed5a3-55dc-4652-936d-fd36e0442d79@wanadoo.fr>
In-Reply-To: <3e1ed5a3-55dc-4652-936d-fd36e0442d79@wanadoo.fr>
From: Ian Rogers <irogers@google.com>
Date: Sun, 25 Feb 2024 09:44:04 -0800
Message-ID: <CAP-5=fWEQdgOsVioWEHr6QNPv81r6VjAR5vyA3OGSuF09RsXBg@mail.gmail.com>
Subject: Re: [PATCH] perf pmu: Fix a potential memory leak in perf_pmu__lookup()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 25, 2024 at 7:42=E2=80=AFAM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Le 26/08/2023 =C3=A0 23:32, Christophe JAILLET a =C3=A9crit :
> > The commit in Fixes has reordered some code, but missed an error handli=
ng
> > path.
> >
> > 'goto err' now, in order to avoid a memory leak in case of error.
> >
> > Fixes: f63a536f03a2 ("perf pmu: Merge JSON events with sysfs at load ti=
me")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
>
> Hi,
>
> polite reminder.

Apologies for the delay.

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> CJ
>
>
> >   tools/perf/util/pmu.c | 7 +++----
> >   1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
> > index bb2ca29cd7bd..8dfce84ad9fe 100644
> > --- a/tools/perf/util/pmu.c
> > +++ b/tools/perf/util/pmu.c
> > @@ -1018,10 +1018,9 @@ struct perf_pmu *perf_pmu__lookup(struct list_he=
ad *pmus, int dirfd, const char
> >        * type value and format definitions. Load both right
> >        * now.
> >        */
> > -     if (pmu_format(pmu, dirfd, name)) {
> > -             free(pmu);
> > -             return NULL;
> > -     }
> > +     if (pmu_format(pmu, dirfd, name))
> > +             goto err;
> > +
> >       pmu->is_core =3D is_pmu_core(name);
> >       pmu->cpus =3D pmu_cpumask(dirfd, name, pmu->is_core);
> >
>

