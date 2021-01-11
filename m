Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C15CE2F1A80
	for <lists+kernel-janitors@lfdr.de>; Mon, 11 Jan 2021 17:10:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388747AbhAKQJH (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 11 Jan 2021 11:09:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51415 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730400AbhAKQJH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 11 Jan 2021 11:09:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610381260;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gR3CElKk0PnSgnXHclh3IlBtMgA5nThX3E70/mb55XA=;
        b=Y86NKsrqdrM1Z/Mbl38cMuhMFWq66fVpUA/Ir9NQW+w2MRO6sIWHyYN1H+ufWau+y2evFd
        p0sksaF9kJgiSjp/A6p038Ps8xXjPFi5inSixp/UTVrc2rE9hJiY/1rcRhIE2RlW40tNUu
        S8UZzQu8XXIYgkgagPmNYDxhIvCOuWI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-Ay7xSj-yMzWAfcsdszLrBg-1; Mon, 11 Jan 2021 11:07:38 -0500
X-MC-Unique: Ay7xSj-yMzWAfcsdszLrBg-1
Received: by mail-qt1-f198.google.com with SMTP id h7so78260qtn.21
        for <kernel-janitors@vger.kernel.org>; Mon, 11 Jan 2021 08:07:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gR3CElKk0PnSgnXHclh3IlBtMgA5nThX3E70/mb55XA=;
        b=gYVHykW9dcPnvkTAjtxXUFnaJAzckWFgEBruh6QFj6qAu/MDccBkebh1eq00tYkwcK
         Plbi42x9mHAezBme1mMtaZEzHFmYhd9UdRNZKBzfjYD6Luz60oKjDqEuaYC98Wcqb80M
         cZjrTpX3O4rVswEVjVD9kvzFvuar1d3JVL9i9fNr9YU3P0HQgyqgIgzbDKnHw4o3YItR
         EDbQWB3Kq0M+uvCRLP7YWiy1CQipYAxJVJXaWjUf3hpIosD/yaVt+hptabrB2ksWbFtF
         SrNHsIvJbEkiEwR5ooume3075Sgm5tw2pJ1ZK/n96MOW4bl5EMk8Lvivwem1LKMW0rMm
         CyGg==
X-Gm-Message-State: AOAM530PJo/gc6Jyy5bbGhL9WG59hpolLL6hKsC1uNKFaaZs79zW4R8q
        T6n4uS6hOIhSTjOGKXZg0NQWbFPn4+7McNFdTrKZkrBo348GEWXoMty+kW/0MmnxCM50TVkv1nt
        RDaScHSeoGiC3/3rbkSsJOy3IMOqf
X-Received: by 2002:ac8:7a82:: with SMTP id x2mr343240qtr.20.1610381258542;
        Mon, 11 Jan 2021 08:07:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxozA1GI+nFom93hyoQJ4M9BtRvKUZlCABqi9lHMk4l6x4HjRnwTYzqc0Cp1kjwkIzE52l8Eg==
X-Received: by 2002:ac8:7a82:: with SMTP id x2mr343227qtr.20.1610381258378;
        Mon, 11 Jan 2021 08:07:38 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id u26sm107305qke.57.2021.01.11.08.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 08:07:37 -0800 (PST)
Subject: Re: [PATCH -next] fpga: dfl-pci: rectify ReST formatting
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>, Wu Hao <hao.wu@intel.com>,
        Moritz Fischer <mdf@kernel.org>,
        Matthew Gerlach <matthew.gerlach@linux.intel.com>,
        linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210111112113.27242-1-lukas.bulwahn@gmail.com>
 <d22ccfa1-19a1-d48c-d822-76ea289965ab@redhat.com>
 <X/x0cJ2N0/VA81FK@kroah.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <422569e9-b85c-7724-51ea-bcbdf6c26bf6@redhat.com>
Date:   Mon, 11 Jan 2021 08:07:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <X/x0cJ2N0/VA81FK@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 1/11/21 7:53 AM, Greg Kroah-Hartman wrote:
> On Mon, Jan 11, 2021 at 07:11:59AM -0800, Tom Rix wrote:
>> On 1/11/21 3:21 AM, Lukas Bulwahn wrote:
>>> Commit fa41d10589be ("fpga: dfl-pci: locate DFLs by PCIe vendor specific
>>> capability") provides documentation to the FPGA Device Feature List (DFL)
>>> Framework Overview, but introduced new documentation warnings:
>>>
>>>   ./Documentation/fpga/dfl.rst:
>>>     505: WARNING: Title underline too short.
>>>     523: WARNING: Unexpected indentation.
>>>     523: WARNING: Blank line required after table.
>>>     524: WARNING: Block quote ends without a blank line; unexpected unindent.
>>>
>>> Rectify ReST formatting in ./Documentation/fpga/dfl.rst.
>> Can you explain how to reproduce this problem ?
> 'make htmldocs'

Thanks, I have verified the problem and its resolution.

Tested-by: Tom Rix <trix@redhat.com>

>

