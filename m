Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F0B1D37DE
	for <lists+linux-sh@lfdr.de>; Fri, 11 Oct 2019 05:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbfJKD2W (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 10 Oct 2019 23:28:22 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:46206 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726096AbfJKD2W (ORCPT <rfc822;linux-sh@vger.kernel.org>);
        Thu, 10 Oct 2019 23:28:22 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 4CAACAEB091A1C599140;
        Fri, 11 Oct 2019 11:28:18 +0800 (CST)
Received: from [127.0.0.1] (10.74.191.121) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Fri, 11 Oct 2019
 11:28:13 +0800
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
To:     Michal Hocko <mhocko@kernel.org>
CC:     Robin Murphy <robin.murphy@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>, <mingo@redhat.com>,
        <bp@alien8.de>, <rth@twiddle.net>, <ink@jurassic.park.msu.ru>,
        <mattst88@gmail.com>, <benh@kernel.crashing.org>,
        <paulus@samba.org>, <mpe@ellerman.id.au>,
        <heiko.carstens@de.ibm.com>, <gor@linux.ibm.com>,
        <borntraeger@de.ibm.com>, <ysato@users.sourceforge.jp>,
        <dalias@libc.org>, <davem@davemloft.net>, <ralf@linux-mips.org>,
        <paul.burton@mips.com>, <jhogan@kernel.org>,
        <jiaxun.yang@flygoat.com>, <chenhc@lemote.com>,
        <akpm@linux-foundation.org>, <rppt@linux.ibm.com>,
        <anshuman.khandual@arm.com>, <tglx@linutronix.de>, <cai@lca.pw>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <hpa@zytor.com>, <x86@kernel.org>,
        <dave.hansen@linux.intel.com>, <luto@kernel.org>,
        <len.brown@intel.com>, <axboe@kernel.dk>, <dledford@redhat.com>,
        <jeffrey.t.kirsher@intel.com>, <linux-alpha@vger.kernel.org>,
        <naveen.n.rao@linux.vnet.ibm.com>, <mwb@linux.vnet.ibm.com>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-s390@vger.kernel.org>,
        <linux-sh@vger.kernel.org>, <sparclinux@vger.kernel.org>,
        <tbogendoerfer@suse.de>, <linux-mips@vger.kernel.org>,
        <rafael@kernel.org>, <gregkh@linuxfoundation.org>
References: <20190924120943.GP2349@hirez.programming.kicks-ass.net>
 <20190924122500.GP23050@dhcp22.suse.cz>
 <20190924124325.GQ2349@hirez.programming.kicks-ass.net>
 <20190924125936.GR2349@hirez.programming.kicks-ass.net>
 <20190924131939.GS23050@dhcp22.suse.cz>
 <1adcbe68-6753-3497-48a0-cc84ac503372@huawei.com>
 <20190925104108.GE4553@hirez.programming.kicks-ass.net>
 <47fa4cee-8528-7c23-c7de-7be1b65aa2ae@huawei.com>
 <bec80499-86d9-bf1f-df23-9044a8099992@arm.com>
 <a5f0fc80-8e88-b781-77ce-1213e5d62125@huawei.com>
 <20191010073212.GB18412@dhcp22.suse.cz>
From:   Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <6cc94f9b-0d79-93a8-5ec2-4f6c21639268@huawei.com>
Date:   Fri, 11 Oct 2019 11:27:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20191010073212.GB18412@dhcp22.suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.74.191.121]
X-CFilter-Loop: Reflected
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

On 2019/10/10 15:32, Michal Hocko wrote:
> On Thu 10-10-19 14:07:21, Yunsheng Lin wrote:
>> On 2019/10/9 20:25, Robin Murphy wrote:
>>> On 2019-10-08 9:38 am, Yunsheng Lin wrote:
>>>> On 2019/9/25 18:41, Peter Zijlstra wrote:
>>>>> On Wed, Sep 25, 2019 at 05:14:20PM +0800, Yunsheng Lin wrote:
>>>>>>  From the discussion above, It seems making the node_to_cpumask_map()
>>>>>> NUMA_NO_NODE aware is the most feasible way to move forwad.
>>>>>
>>>>> That's still wrong.
>>>>
>>>> Hi, Peter
>>>>
>>>> It seems this has trapped in the dead circle.
>>>>
>>>>  From my understanding, NUMA_NO_NODE which means not node numa preference
>>>> is the state to describe the node of virtual device or the physical device
>>>> that has equal distance to all cpu.
>>>>
>>>> We can be stricter if the device does have a nearer node, but we can not
>>>> deny that a device does not have a node numa preference or node affinity,
>>>> which also means the control or data buffer can be allocated at the node where
>>>> the process is running.
>>>>
>>>> As you has proposed, making it -2 and have dev_to_node() warn if the device does
>>>> have a nearer node and not set by the fw is a way to be stricter.
>>>>
>>>> But I think maybe being stricter is not really relevant to NUMA_NO_NODE, because
>>>> we does need a state to describe the device that have equal distance to all node,
>>>> even if it is not physically scalable.
>>>>
>>>> Any better suggestion to move this forward?
>>>
>>> FWIW (since this is in my inbox), it sounds like the fundamental issue is that NUMA_NO_NODE is conflated for at least two different purposes, so trying to sort that out would be a good first step. AFAICS we have genuine "don't care" cases like alloc_pages_node(), where if the producer says it doesn't matter then the consumer is free to make its own judgement on what to do, and fundamentally different "we expect this thing to have an affinity but it doesn't, so we can't say what's appropriate" cases which could really do with some separate indicator like "NUMA_INVALID_NODE".
>>>
>>> The tricky part is then bestowed on the producers to decide whether they can downgrade "invalid" to "don't care". You can technically build 'a device' whose internal logic is distributed between nodes and thus appears to have equal affinity - interrupt controllers, for example, may have per-CPU or per-node interfaces that end up looking like that - so although it's unlikely it's not outright nonsensical. Similarly a 'device' that's actually emulated behind a firmware call interface may well effectively have no real affinity.
>>
>> We may set node of the physical device to NUMA_INVALID_NODE when fw does not
>> provide one.
>>
>> But what do we do about NUMA_INVALID_NODE when alloc_pages_node() is called
>> with nid being NUMA_INVALID_NODE?
> 
> There is nothing sensible the allocator can do. The only point of
> NUMA_INVALID_NODE would be to catch potential misconfiguration and
> report them to users so they can complain to their HW/FS suppliers.
> 
> Pushing it to other susbystem doesn't make much sense IMHO because there
> is nothing really actionable. Refusing an allocation altogether sounds
> like a bad plan to me.
>  
>> If we change the node to default one(like node 0) when node of device is
>> NUMA_INVALID_NODE in device_add(), how do we know the default one(like node 0)
>> is the right one to choose?
> 
> Exactly. We cannot really assume any node in that situation.
>  
>> >From the privous disccusion, the below seems not get to consensus yet:
>> 1) Do we need a state like NUMA_NO_NODE to describe that the device does not
>>    have any numa preference?
> 
> This is a traditional meaning MM subsystem is using.
> 
>> 2) What do we do if the fw does not provide a node for the device? Should
>>    we guess and pick one for it and how do we do the guessing? Or leave it
>>    as it is and handle it as NUMA_NO_NODE?
> 
> As already pointed several times, picking any node is rather error
> prone. You can never assume topology. We used to assume that there
> always be node 0 but that is not really the case (see 3e8589963773
> ("memcg: make it work on sparse non-0-node systems")). Nodes might also
> come and go so this might just lead to all sorts of subtle problems.
> 
> On the other hand using NUMA_NO_NODE as no preference could only lead to
> slightly sub optimal performance.
> 
> I do agree with Peter that reporting a lack of affinity might be useful
> but we shouldn't really try to clever and make up the affinity nilly
> willy

Ok, thanks for clarify.

So it seems we need to do the below if I understand it correctly:
1. fix up the node id of device that has a clear node affinity without it
   being set as much as possible.
2. catch the case when the device that should have a nearer node but without
   being set and warn about it.

But I failed to see why the above is related to making node_to_cpumask_map()
NUMA_NO_NODE aware?

There is clear bug here too when node_to_cpumask_map() is not handling
NUMA_NO_NODE.

Maybe we can make the node_to_cpumask_map() NUMA_NO_NODE aware first and then
deal with the above because event after the above is handled, we still need to
handle NUMA_NO_NODE in node_to_cpumask_map() and it may take times to deal with
the above when it is tricky to decide whether or not a device has a clear node.

.
> 

